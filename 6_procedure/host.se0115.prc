SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE se0115 (
   PV_REFCURSOR             IN OUT   PKG_REPORT.REF_CURSOR,
   OPT                      IN       VARCHAR2,
   PV_BRID                  IN       VARCHAR2,
   TLGOUPS                  IN       VARCHAR2,
   TLSCOPE                  IN       VARCHAR2,
   PV_TXCODE                IN       VARCHAR2,
   PV_TLID        IN       VARCHAR2
)
IS

    v_TXDATE date;
    v_TXNUM varchar2(10);
BEGIN


    v_TXNUM:= SUBSTR2(PV_TXCODE,1,10);

    begin
        v_TXDATE := TO_DATE(SUBSTR2(PV_TXCODE,11),'RRRRMMDD');
        exception
       when others
       then
            v_TXDATE := getcurrdate + 1;
    end;


OPEN PV_REFCURSOR
FOR
    SELECT SO.AUTOID, SO.TXDATE, SO.TXNUM, SO.TXNUM||TO_CHAR(SO.TXDATE,'RRRRMMDD') TXCODE, SB.SYMBOL, SO.TRADE, SO.BLOCKED,
        CF2.CUSTODYCD OLDCUSTODYCD, CF2.FULLNAME OLDCUSTNAME, AF2.ACCTNO OLDAFACCTNO, SO.OLDSHAREHOLDERSID,
        CF2.IDCODE OLDIDCODE, CF2.IDDATE OLDIDDATE, CF2.IDPLACE OLDIDPLACE, CF2.ADDRESS OLDADDRESS,CF2.MOBILE OLDMOBILE, CF2.FAX OLDFAX,
        NVL(CR2.REFULLNAME,'') OLDREFULLNAME, NVL(CR2.RETYPE,'') OLDRETYPE, CF2.TAXCODE OLDTAXCODE, NVL(CT2.ADDRESS,'') OLDCTADDRESS,
        CF1.CUSTODYCD NEWCUSTODYCD, CF1.FULLNAME NEWCUSTNAME, AF1.ACCTNO NEWAFACCTNO, SO.SHAREHOLDERSID NEWSHAREHOLDERSID,
        CF1.IDCODE NEWIDCODE, CF1.IDDATE NEWIDDATE, CF1.IDPLACE NEWIDPLACE, CF1.ADDRESS NEWADDRESS,CF1.MOBILE NEWMOBILE, CF1.FAX NEWFAX,
        NVL(CR1.REFULLNAME,'') NEWREFULLNAME, NVL(CR1.RETYPE,'') NEWRETYPE, CF1.TAXCODE NEWTAXCODE, NVL(CT1.ADDRESS,'') NEWCTADDRESS,
        ISS.fullname ISSFULLNAME, A1.CDCONTENT SECTYPE, TF.FEERATE, TF.MINVAL, TF.FEEAMT,
        (SO.TRADE + SO.BLOCKED) QTTY, (SO.TRADE + SO.BLOCKED)*SB.PARVALUE AMOUNT
    FROM SEOTCTRANLOG SO, AFMAST AF1, SBSECURITIES SB, ISSUERS ISS, AFMAST AF2,
        (
            SELECT CUSTID, CUSTODYCD, FULLNAME, IDCODE, IDDATE, IDPLACE, ADDRESS, MOBILESMS MOBILE, FAX, TAXCODE
            FROM CFMAST
            WHERE INSTR(TLGOUPS, CAREBY)>0
        ) CF1,
        (
            SELECT CUSTID, CUSTODYCD, FULLNAME, IDCODE, IDDATE, IDPLACE, ADDRESS, MOBILESMS MOBILE, FAX, TAXCODE
            FROM CFMAST
            WHERE INSTR(TLGOUPS, CAREBY)>0
        ) CF2,
        (
            SELECT TRIM(CR.CUSTID) CUSTID, TRIM(CF.CUSTID) RECUSTID, A1.CDCONTENT RETYPE, CR.FULLNAME REFULLNAME
            FROM (
                SELECT CUSTID, MAX(AUTOID) AUTOID
                FROM CFRELATION CR
                WHERE ACTIVES = 'Y'
                GROUP BY CUSTID
            )MX, CFRELATION CR, ALLCODE A1, CFMAST CF
            WHERE MX.AUTOID = CR.AUTOID
                AND TRIM(CR.RECUSTID) = CF.CUSTID
                AND CR.RETYPE = A1.CDVAL AND A1.CDTYPE = 'CF' AND A1.CDNAME = 'RETYPE'
        )CR1,(
            SELECT TRIM(CR.CUSTID) CUSTID, TRIM(CF.CUSTID) RECUSTID, A1.CDCONTENT RETYPE, CR.FULLNAME REFULLNAME
            FROM (
                SELECT CUSTID, MAX(AUTOID) AUTOID
                FROM CFRELATION CR
                WHERE ACTIVES = 'Y'
                GROUP BY CUSTID
            )MX, CFRELATION CR, ALLCODE A1, CFMAST CF
            WHERE MX.AUTOID = CR.AUTOID
                AND TRIM(CR.RECUSTID) = CF.CUSTID
                AND CR.RETYPE = A1.CDVAL AND A1.CDTYPE = 'CF' AND A1.CDNAME = 'RETYPE'
        )CR2,
        (
            SELECT CUSTID, MAX(ADDRESS) ADDRESS
            FROM CFCONTACT
            GROUP BY CUSTID
        ) CT1,
        (
            SELECT CUSTID, MAX(ADDRESS) ADDRESS
            FROM CFCONTACT
            GROUP BY CUSTID
        ) CT2,
        ALLCODE A1,(
            SELECT TF.TXDATE, TF.TXNUM, MAX(DECODE(TF.FLDCD,'41',TF.NVALUE,0)) FEERATE, MAX(DECODE(TF.FLDCD,'42',TF.NVALUE,0)) MINVAL,
                MAX(DECODE(TF.FLDCD,'46',TF.NVALUE,0)) FEEAMT,MAX(DECODE(TF.FLDCD,'09',TF.NVALUE,0)) PRICE
            FROM VW_TLLOGFLD_ALL TF
            WHERE TF.TXDATE = v_TXDATE
                AND TF.TXNUM = v_TXNUM
                AND TF.FLDCD IN ('41','42','46','09')
            GROUP BY TF.TXDATE, TF.TXNUM
        ) TF
    WHERE SO.TLTXCD = '2229' AND SO.DELTD <> 'Y'
        AND SUBSTR(SO.SEACCTNO,11) = SB.CODEID
        AND SB.ISSUERID = ISS.ISSUERID
        AND SUBSTR(SO.SEACCTNO,1,10)=AF1.ACCTNO
        AND SUBSTR(SO.OLDSEACCTNO,1,10)=AF2.ACCTNO
        AND AF1.CUSTID = CF1.CUSTID
        AND AF2.CUSTID = CF2.CUSTID
        AND SO.TXDATE = TF.TXDATE
        AND SO.TXNUM = TF.TXNUM
        AND CF1.CUSTID = CR1.CUSTID(+)
        AND CF2.CUSTID = CR2.CUSTID(+)
        AND CF1.CUSTID = CT1.CUSTID(+)
        AND CF2.CUSTID = CT2.CUSTID(+)
        AND A1.CDVAL = SB.SECTYPE AND A1.CDNAME = 'SECTYPE' AND A1.CDTYPE ='SA'
        AND SO.TXDATE = v_TXDATE
        AND SO.TXNUM = v_TXNUM

        ;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;
 
 
 
/