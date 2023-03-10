SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CAL_LNINTACR"
   (INDATE IN VARCHAR2)
   IS
    V_INDATE VARCHAR2(10);
    v_strYEAR VARCHAR2(4);
    v_dblINTNMLACR NUMBER(20,4);
    v_dblINTOVDACR NUMBER(20,4);
    v_dblOINTNMLACR NUMBER(20,4);
    v_dblOINTOVDACR NUMBER(20,4);
    v_intDAYS NUMBER(20);
    v_dblAMT NUMBER(20,4);
    v_dblDRATE NUMBER(10);

BEGIN
    V_INDATE:=indate;
    FOR REC IN
        (SELECT ACCTNO, DRATE, TRFACCTNO,
            RATE1, RATE2, RATE3, ORATE1, ORATE2, ORATE3,
            PRINNML+PRINOVD+INTNMLACR+INTOVDACR+INTNMLOVD+INTDUE-INTPREPAID+OPRINNML+OPRINOVD+OINTNMLACR++OINTOVDACR+OINTNMLOVD+OINTDUE-OINTPREPAID+FEE+FEEDUE+FEEOVD ODAMT,
            PRINNML, PRINOVD, OPRINNML, OPRINOVD
        FROM LNMAST
        WHERE STATUS NOT IN ('P','R','C') AND PRINNML+OPRINNML+PRINOVD+OPRINNML > 0
        ORDER BY ACCTNO
        )
    LOOP
        v_dblINTNMLACR:= 0;
        v_dblINTOVDACR:= 0;
        v_dblOINTNMLACR:= 0;
        v_dblOINTOVDACR:= 0;
        Case
            When REC.DRATE= 'D1' then v_dblDRATE:= 30;
            When REC.DRATE= 'D2' then v_dblDRATE:= TO_NUMBER(TO_CHAR(LAST_DAY(TO_DATE(V_INDATE,'dd/mm/rrrr')),'dd'));
            When REC.DRATE= 'Y1' then v_dblDRATE:= 360;
            When REC.DRATE= 'Y2' then
                v_strYEAR:= SUBSTR(V_INDATE,7);
                v_dblDRATE:= TO_DATE(CONCAT('31/12/',v_strYEAR),'dd/mm/rrrr') - TO_DATE(CONCAT('01/01/',v_strYEAR),'dd/mm/rrrr') + 1;
        End case;

        -- Lai tren goc trong han
        -- Lai vay margin
        IF REC.PRINNML > 0 THEN
            FOR REC1 IN
                (SELECT AUTOID, NML, ACRDATE, REFTYPE FROM LNSCHD WHERE ACCTNO=  REC.ACCTNO AND NML > 0 AND DUEDATE >= TO_DATE(V_INDATE,'dd/mm/rrrr') AND REFTYPE ='P')
            LOOP
                v_intDAYS:= TO_DATE(V_INDATE,'dd/mm/yyyy') - REC1.ACRDATE;
                v_dblAMT:= ROUND(REC1.NML * REC.RATE1 / 100 * v_intDAYS / v_dblDRATE,4);
                v_dblINTNMLACR:= v_dblINTNMLACR + v_dblAMT;
                IF v_dblAMT > 0 then
                    INSERT INTO LNINTTRAN (AUTOID, ACCTNO, INTTYPE, FRDATE, TODATE, ICRULE, IRRATE, INTBAL, INTAMT, LNSCHDID)
                    VALUES(SEQ_CIINTTRAN.NEXTVAL, REC.ACCTNO, 'I', REC1.ACRDATE, TO_DATE(V_INDATE,'dd/mm/yyyy'), 'S', REC.RATE1, REC1.NML, v_dblAMT, REC1.AUTOID);
                    INSERT INTO LNSCHDLOG(AUTOID, TXNUM, TXDATE, NML, OVD, PAID, INTNMLACR, FEE, INTDUE, INTOVD, INTOVDPRIN, FEEDUE, FEEOVD, INTPAID, FEEPAID)
                    VALUES(REC1.AUTOID, NULL, TO_DATE(V_INDATE,'dd/mm/yyyy'), 0, 0, 0, v_dblAMT, 0, 0, 0, 0, 0, 0, 0 ,0);
                End If;
                UPDATE LNSCHD SET ACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), INTNMLACR = INTNMLACR + v_dblAMT, DUE='N' WHERE AUTOID = REC1.AUTOID;
            END LOOP;

            FOR REC2 IN
                (SELECT AUTOID, NML, ACRDATE, REFTYPE FROM LNSCHD WHERE ACCTNO=  REC.ACCTNO AND NML > 0 AND DUEDATE < TO_DATE(V_INDATE,'dd/mm/rrrr') AND OVERDUEDATE >= TO_DATE(V_INDATE,'dd/mm/rrrr') AND REFTYPE ='P')
            LOOP
                v_intDAYS:= TO_DATE(V_INDATE,'dd/mm/yyyy') - REC2.ACRDATE;
                v_dblAMT:= ROUND(REC2.NML * REC.RATE2 / 100 * v_intDAYS / v_dblDRATE,4);
                v_dblINTNMLACR:= v_dblINTNMLACR + v_dblAMT;
                If v_dblAMT > 0 then
                    INSERT INTO LNINTTRAN (AUTOID, ACCTNO, INTTYPE, FRDATE, TODATE, ICRULE, IRRATE, INTBAL, INTAMT, LNSCHDID)
                    VALUES(SEQ_CIINTTRAN.NEXTVAL, REC.ACCTNO, 'I', REC2.ACRDATE, TO_DATE(V_INDATE,'dd/mm/yyyy'), 'S', REC.RATE2, REC2.NML, v_dblAMT, REC2.AUTOID);
                    INSERT INTO LNSCHDLOG(AUTOID, TXNUM, TXDATE, NML, OVD, PAID, INTNMLACR, FEE, INTDUE, INTOVD, INTOVDPRIN, FEEDUE, FEEOVD, INTPAID, FEEPAID)
                    VALUES(REC2.AUTOID, NULL, TO_DATE(V_INDATE,'dd/mm/yyyy'), 0, 0, 0, v_dblAMT, 0, 0, 0, 0, 0, 0, 0 ,0);
                End If;
                UPDATE LNSCHD SET ACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), INTNMLACR = INTNMLACR + v_dblAMT,DUE='N' WHERE AUTOID = REC2.AUTOID;
            END LOOP;
        END IF;

        -- Tinh lai vay T0
        IF REC.OPRINNML > 0 THEN
            FOR REC3 IN
                (SELECT AUTOID, NML, ACRDATE, REFTYPE FROM LNSCHD WHERE ACCTNO=  REC.ACCTNO AND NML > 0 AND DUEDATE >= TO_DATE(V_INDATE,'dd/mm/rrrr') AND REFTYPE ='GP')
            LOOP
                v_intDAYS:= TO_DATE(V_INDATE,'dd/mm/yyyy') - REC3.ACRDATE;
                v_dblAMT:= ROUND(REC3.NML * REC.ORATE1 / 100 * v_intDAYS / v_dblDRATE,4);
                v_dblOINTNMLACR:= v_dblOINTNMLACR + v_dblAMT;
                If v_dblAMT > 0 then
                    INSERT INTO LNINTTRAN (AUTOID, ACCTNO, INTTYPE, FRDATE, TODATE, ICRULE, IRRATE, INTBAL, INTAMT, LNSCHDID)
                    VALUES(SEQ_CIINTTRAN.NEXTVAL, REC.ACCTNO, 'GI', REC3.ACRDATE, TO_DATE(V_INDATE,'dd/mm/yyyy'), 'S', REC.ORATE1, REC3.NML, v_dblAMT, REC3.AUTOID);
                    INSERT INTO LNSCHDLOG(AUTOID, TXNUM, TXDATE, NML, OVD, PAID, INTNMLACR, FEE, INTDUE, INTOVD, INTOVDPRIN, FEEDUE, FEEOVD, INTPAID, FEEPAID)
                    VALUES(REC3.AUTOID, NULL, TO_DATE(V_INDATE,'dd/mm/yyyy'), 0, 0, 0, v_dblAMT, 0, 0, 0, 0, 0, 0, 0 ,0);
                End If;
                UPDATE LNSCHD SET ACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), INTNMLACR = INTNMLACR + v_dblAMT,DUE='N' WHERE AUTOID = REC3.AUTOID;
            END LOOP;

            FOR REC4 IN
                (SELECT AUTOID, NML, ACRDATE, REFTYPE FROM LNSCHD WHERE ACCTNO=  REC.ACCTNO AND NML > 0 AND DUEDATE < TO_DATE(V_INDATE,'dd/mm/rrrr') AND OVERDUEDATE >= TO_DATE(V_INDATE,'dd/mm/rrrr') AND REFTYPE ='GP')
            LOOP
                v_intDAYS:= TO_DATE(V_INDATE,'dd/mm/yyyy') - REC4.ACRDATE;
                v_dblAMT:= ROUND(REC4.NML * REC.ORATE2 / 100 * v_intDAYS / v_dblDRATE,4);
                v_dblOINTNMLACR:= v_dblOINTNMLACR + v_dblAMT;
                If v_dblAMT > 0 then
                    INSERT INTO LNINTTRAN (AUTOID, ACCTNO, INTTYPE, FRDATE, TODATE, ICRULE, IRRATE, INTBAL, INTAMT, LNSCHDID)
                    VALUES(SEQ_CIINTTRAN.NEXTVAL, REC.ACCTNO, 'GI', REC4.ACRDATE, TO_DATE(V_INDATE,'dd/mm/yyyy'), 'S', REC.ORATE2, REC4.NML, v_dblAMT, REC4.AUTOID);
                    INSERT INTO LNSCHDLOG(AUTOID, TXNUM, TXDATE, NML, OVD, PAID, INTNMLACR, FEE, INTDUE, INTOVD, INTOVDPRIN, FEEDUE, FEEOVD, INTPAID, FEEPAID)
                    VALUES(REC4.AUTOID, NULL, TO_DATE(V_INDATE,'dd/mm/yyyy'), 0, 0, 0, v_dblAMT, 0, 0, 0, 0, 0, 0, 0 ,0);
                End If;
                UPDATE LNSCHD SET ACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), INTNMLACR = INTNMLACR + v_dblAMT,DUE='N' WHERE AUTOID = REC4.AUTOID;
            END LOOP;
        END IF;

        -- Lai tren goc qua han
        -- Lai margin
        IF REC.PRINOVD > 0 THEN
            FOR REC5 IN
                (SELECT AUTOID, OVD, OVDACRDATE, REFTYPE FROM LNSCHD WHERE ACCTNO=  REC.ACCTNO AND OVD > 0 AND OVERDUEDATE < TO_DATE(V_INDATE,'dd/mm/rrrr') AND REFTYPE ='P')
            LOOP
                v_intDAYS:= TO_DATE(V_INDATE,'dd/mm/yyyy') - REC5.OVDACRDATE;
                v_dblAMT:= ROUND(REC5.OVD * REC.RATE3 / 100 * v_intDAYS / v_dblDRATE,4);
                v_dblINTOVDACR:= v_dblINTOVDACR + v_dblAMT;
                If v_dblAMT > 0 then
                    INSERT INTO LNINTTRAN (AUTOID, ACCTNO, INTTYPE, FRDATE, TODATE, ICRULE, IRRATE, INTBAL, INTAMT, LNSCHDID)
                    VALUES(SEQ_CIINTTRAN.NEXTVAL, REC.ACCTNO, 'O', REC5.OVDACRDATE, TO_DATE(V_INDATE,'dd/mm/yyyy'), 'S', REC.RATE3, REC5.OVD, v_dblAMT, REC5.AUTOID);
                    INSERT INTO LNSCHDLOG(AUTOID, TXNUM, TXDATE, NML, OVD, PAID, INTNMLACR, FEE, INTDUE, INTOVD, INTOVDPRIN, FEEDUE, FEEOVD, INTPAID, FEEPAID)
                    VALUES(REC5.AUTOID, NULL, TO_DATE(V_INDATE,'dd/mm/yyyy'), 0, 0, 0, 0, 0, 0, 0, v_dblAMT, 0, 0, 0 ,0);
                End If;
                UPDATE LNSCHD SET OVDACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), INTOVDPRIN = INTOVDPRIN + v_dblAMT WHERE AUTOID = REC5.AUTOID;

            END LOOP;
        END IF;


        -- Lai T0
        IF REC.OPRINOVD > 0 THEN
            FOR REC6 IN
                (SELECT AUTOID, OVD, OVDACRDATE, REFTYPE FROM LNSCHD WHERE ACCTNO=  REC.ACCTNO AND OVD > 0 AND OVERDUEDATE < TO_DATE(V_INDATE,'dd/mm/rrrr') AND REFTYPE ='GP')
            LOOP
                v_intDAYS:= TO_DATE(V_INDATE,'dd/mm/yyyy') - REC6.OVDACRDATE;
                v_dblAMT:= ROUND(REC6.OVD * REC.ORATE3 / 100 * v_intDAYS / v_dblDRATE,4);
                v_dblOINTOVDACR:= v_dblOINTOVDACR + v_dblAMT;
                If v_dblAMT > 0 then
                    INSERT INTO LNINTTRAN (AUTOID, ACCTNO, INTTYPE, FRDATE, TODATE, ICRULE, IRRATE, INTBAL, INTAMT, LNSCHDID)
                    VALUES(SEQ_CIINTTRAN.NEXTVAL, REC.ACCTNO, 'GO', REC6.OVDACRDATE, TO_DATE(V_INDATE,'dd/mm/yyyy'), 'S', REC.ORATE3, REC6.OVD, v_dblAMT, REC6.AUTOID);
                    INSERT INTO LNSCHDLOG(AUTOID, TXNUM, TXDATE, NML, OVD, PAID, INTNMLACR, FEE, INTDUE, INTOVD, INTOVDPRIN, FEEDUE, FEEOVD, INTPAID, FEEPAID)
                    VALUES(REC6.AUTOID, NULL, TO_DATE(V_INDATE,'dd/mm/yyyy'), 0, 0, 0, 0, 0, 0, 0, v_dblAMT, 0, 0, 0 ,0);
                End If;
                UPDATE LNSCHD SET OVDACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), INTOVDPRIN = INTOVDPRIN + v_dblAMT WHERE AUTOID = REC6.AUTOID;
            END LOOP;
        END IF;

        UPDATE LNMAST SET INTNMLACR = INTNMLACR + v_dblINTNMLACR, OINTNMLACR = OINTNMLACR + v_dblOINTNMLACR, INTOVDACR = INTOVDACR + v_dblINTOVDACR, OINTOVDACR = OINTOVDACR + v_dblOINTOVDACR, ACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy'), OACRDATE = TO_DATE(V_INDATE,'dd/mm/yyyy') WHERE ACCTNO = REC.ACCTNO;
        UPDATE CIMAST SET ODAMT = REC.ODAMT + v_dblOINTNMLACR + v_dblINTNMLACR + v_dblINTOVDACR + v_dblOINTOVDACR WHERE ACCTNO = REC.TRFACCTNO;

    END LOOP;

EXCEPTION
    WHEN others THEN
        return;
END; -- Procedure

 
 
 
 
/
