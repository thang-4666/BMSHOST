SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE ca0037(PV_REFCURSOR IN OUT PKG_REPORT.REF_CURSOR,
                                     OPT          IN VARCHAR2,
                                     pv_BRID      IN VARCHAR2,
                                     TLGOUPS      IN VARCHAR2,
                                     TLSCOPE      IN VARCHAR2,
                                     CACODE       in varchar2,
                                     I_BRIDGD    in varchar2) IS
  --
  -- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
  -- BAO CAO TAI KHOAN TIEN TONG HOP CUA NGUOI DAU TU
  -- MODIFICATION HISTORY
  -- PERSON      DATE    COMMENTS
  -- THANHNM   23-APR-12  CREATED
  -- ---------   ------  -------------------------------------------

  CUR         PKG_REPORT.REF_CURSOR;
  V_STROPTION VARCHAR2(5); -- A: ALL; B: BRANCH; S: SUB-BRANCH
  V_STRBRID   VARCHAR2(40);
  V_INBRID    VARCHAR2(4);
  V_CACODE    VARCHAR2(20);
  V_I_BRIDGD    VARCHAR2(20);
BEGIN

  V_STROPTION := upper(OPT);
  V_INBRID    := pv_BRID;
  IF (V_STROPTION = 'A') THEN
    V_STRBRID := '%';
  ELSE
    if (V_STROPTION = 'B') then
      select br.mapid
        into V_STRBRID
        from brgrp br
       where br.brid = V_INBRID;
    else
      V_STRBRID := V_INBRID;
    end if;
  END IF;

  IF (CACODE <> 'ALL') THEN
    V_CACODE := CACODE;
  ELSE
    V_CACODE := '%';
  END IF;
   IF (I_BRIDGD <> 'ALL') THEN
    V_I_BRIDGD := I_BRIDGD;
  ELSE
    V_I_BRIDGD := '%';
  END IF;
  -- GET REPORT'S PARAMETERS
  OPEN PV_REFCURSOR FOR
    SELECT CF.CUSTODYCD, CF.FULLNAME, CF.ADDRESS, CF.MOBILESMS,
        SB.SYMBOL, CF.IDCODE, CF.IDDATE, CF.IDPLACE, SUM(CAS.TRADE) TRADE,
        SUM(CAS.BALANCE+CAS.PBALANCE) BALANCE, to_char(CA.BEGINDATE,'dd/MM/yyyy') BEGINDATE, to_char(CA.DUEDATE,'dd/MM/yyyy')  DUEDATE,
        to_char(CA.FRDATETRANSFER,'dd/MM/yyyy') FRDATETRANSFER, to_char(CA.TODATETRANSFER,'dd/MM/yyyy') TODATETRANSFER, CA.EXPRICE,
        SUBSTR(CA.EXRATE,1,INSTR(CA.EXRATE,'/')-1) EXRATE1,
        SUBSTR(CA.EXRATE,INSTR(CA.EXRATE,'/')+1) EXRATE2, CA.EXRATE,
        SUBSTR(CA.RIGHTOFFRATE,1,INSTR(CA.RIGHTOFFRATE,'/')-1) RIGHTOFFRATE1,
        SUBSTR(CA.RIGHTOFFRATE,INSTR(CA.RIGHTOFFRATE,'/')+1) RIGHTOFFRATE2,
        CA.RIGHTOFFRATE, ISS.FULLNAME ISSNAME, SB.PARVALUE
    FROM CAMAST CA, CASCHD CAS, AFMAST AF, CFMAST CF, SBSECURITIES SB, ISSUERS iss
    WHERE CA.CATYPE = '014' AND CA.CAMASTID = CAS.CAMASTID
        AND CA.CAMASTID = V_CACODE AND SB.ISSUERID = ISS.ISSUERID
        AND CAS.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID
        AND CA.CODEID = SB.CODEID AND CF.CUSTATCOM = 'Y'
        AND CF.BRID like V_I_BRIDGD
    GROUP BY CF.CUSTODYCD, CF.FULLNAME, CF.ADDRESS, CF.MOBILESMS,
        SB.SYMBOL, CF.IDCODE, CF.IDDATE, CF.IDPLACE, CA.BEGINDATE, CA.DUEDATE,
        CA.FRDATETRANSFER, CA.TODATETRANSFER, CA.EXPRICE, CA.EXRATE, CA.RIGHTOFFRATE,
        ISS.FULLNAME, SB.PARVALUE
    ;

EXCEPTION
  WHEN OTHERS THEN
    RETURN;
END;
 
 
 
 
/
