SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_cigetdepofeeamt(strACCTNO IN varchar2, strCODEID IN varchar2, strBUSDATE IN varchar2, strTXDATE IN varchar2, dblQTTY IN NUMBER)
  RETURN  number
  IS
  v_strTRADEPLACE   varchar2(10);
  v_strSECTYPEEXT   varchar2(10);
  v_strSECTYPE      varchar2(10);
  v_strFORP         varchar2(10);
  v_strROUNDTYP     varchar2(10);
  v_dtmLASTACRDT    DATE;
  v_dblFEEAMT    number(20,4);
  v_dblLOTDAY    number(20,0);
  v_dblLOTVAL    number(20,0);
  v_dblFEERATIO    number(20,6);  --h? s? fee
  v_dblNUMOFDAYS  number(20,0);
  v_Result      number(20);
  l_issedepofee char(1);
BEGIN
/*
  --L?y tham s? c?a ch?ng kho?  SELECT TRADEPLACE, SECTYPE,issedepofee
  INTO v_strTRADEPLACE, v_strSECTYPE ,l_issedepofee
  FROM SBSECURITIES WHERE CODEID=strCODEID;
  -- kiem tra xem CK co thu phi lk ko
  if(l_issedepofee='N') THEN
     RETURN 0;
  END IF;
  IF v_strSECTYPE='001' OR v_strSECTYPE='002' OR v_strSECTYPE='007' OR v_strSECTYPE='008' THEN
    v_strSECTYPEEXT := '111'; --Co phieu va chung chi quy
  ELSIF v_strSECTYPE='003' OR v_strSECTYPE='006' THEN
    v_strSECTYPEEXT := '222'; --Trai phieu
  ELSE
    v_strSECTYPEEXT := v_strSECTYPE;
  END IF;
  --X?d?nh s? ng?t? ph??n h?n:
  --N?u strBUSDATE<=v_dtmLASTACRDT th?? t? v_dtmLASTACRDT
  --N?u strBUSDATE>v_dtmLASTACRDT th?? t? strBUSDATE
  SELECT nvl (DEPOLASTDT,TO_DATE(strBUSDATE,'DD/MM/RRRR')) into v_dtmLASTACRDT FROM CIMAST WHERE AFACCTNO=strACCTNO;

  SELECT TO_DATE(strBUSDATE,'DD/MM/RRRR')- v_dtmLASTACRDT INTO v_dblNUMOFDAYS FROM DUAL;

  IF v_dblNUMOFDAYS >= 0 THEN
    RETURN 0; --kh?c???n h?n
  ELSE
    SELECT v_dtmLASTACRDT-TO_DATE(strBUSDATE,'DD/MM/RRRR') + 1 INTO v_dblNUMOFDAYS FROM DUAL;
    IF v_dblNUMOFDAYS <= 0 THEN
      RETURN 0;
    END IF;
  END IF;

  --L?y bi?u ph?K c?a ch?ng kho?  --Uu ti?ph??t ri? cho ch?ng kho?  --N?u kh?c?d?t ri? theo ch?ng kho?s? x?d?n c?d?t ri? cho TRADEPLACE
  SELECT FORP, FEEAMT, LOTDAY, LOTVAL, ROUNDTYP INTO v_strFORP, v_dblFEEAMT, v_dblLOTDAY, v_dblLOTVAL, v_strROUNDTYP
  FROM (SELECT * FROM
          (-- bieu phi dac biet
          SELECT RF.ACTYPE AUTOID, RF.FORP, RF.FEEAMT, RF.LOTDAY, RF.LOTVAL, RF.ROUNDTYP, 1 ODRNUM,
          ROUND((DECODE(RF.FORP,'P',RF.FEEAMT/100,RF.FEEAMT)/(RF.LOTDAY*RF.LOTVAL)),8) AMT_TEMP
          FROM CIMAST MST, CIFEEDEF_EXT RF,AFMAST AF,CIFEEDEF_EXTLNK LNK
          WHERE  MST.AFACCTNO=strACCTNO
          AND RF.CODEID=strCODEID AND rf.status='A'
          AND MST.ACCTNO=AF.ACCTNO
          AND AF.STATUS IN ('A','P')
          AND RF.ACTYPE=LNK.ACTYPE AND LNK.Afacctno=AF.ACCTNO AND LNK.STATUS='A'
          UNION ALL
          SELECT RF.ACTYPE AUTOID, RF.FORP, RF.FEEAMT, RF.LOTDAY, RF.LOTVAL, RF.ROUNDTYP, 1 ODRNUM,
          ROUND((DECODE(RF.FORP,'P',RF.FEEAMT/100,RF.FEEAMT)/(RF.LOTDAY*RF.LOTVAL)),8) AMT_TEMP
          FROM CIMAST MST,  CIFEEDEF_EXT RF, AFMAST AF,CIFEEDEF_EXTLNK LNK
          WHERE MST.AFACCTNO=strACCTNO
          AND RF.CODEID IS NULL AND (RF.SECTYPE=v_strSECTYPE or RF.SECTYPE=v_strSECTYPEEXT) AND RF.TRADEPLACE=v_strTRADEPLACE
          AND rf.status='A'
          AND MST.ACCTNO=AF.ACCTNO
          AND AF.STATUS IN ('A','P')
          AND RF.ACTYPE=LNK.ACTYPE AND LNK.Afacctno=AF.ACCTNO AND LNK.STATUS='A'
          UNION ALL
          SELECT RF.ACTYPE AUTOID, RF.FORP, RF.FEEAMT, RF.LOTDAY, RF.LOTVAL, RF.ROUNDTYP, 1 ODRNUM,
          ROUND((DECODE(RF.FORP,'P',RF.FEEAMT/100,RF.FEEAMT)/(RF.LOTDAY*RF.LOTVAL)),8) AMT_TEMP
          FROM CIMAST MST, CIFEEDEF_EXT RF,AFMAST AF,CIFEEDEF_EXTLNK LNK
          WHERE  MST.AFACCTNO=strACCTNO
          AND rf.status='A'
          AND MST.ACCTNO=AF.ACCTNO
          AND AF.STATUS IN ('A','P')
          AND RF.CODEID IS NULL AND (RF.SECTYPE=v_strSECTYPE or RF.SECTYPE=v_strSECTYPEEXT) AND RF.TRADEPLACE='000'
           AND RF.ACTYPE=LNK.ACTYPE AND LNK.Afacctno=AF.ACCTNO AND LNK.STATUS='A'
          --bieu phi thuong
          UNION ALL
          SELECT TO_CHar(RF.AUTOID) AUTOID, RF.FORP, RF.FEEAMT, RF.LOTDAY, RF.LOTVAL, RF.ROUNDTYP, 2 ODRNUM,
          ROUND((DECODE(RF.FORP,'P',RF.FEEAMT/100,RF.FEEAMT)/(RF.LOTDAY*RF.LOTVAL)),8) AMT_TEMP
          FROM CIMAST MST, CITYPE TYP, CIFEEDEF RF,AFMAST AF
          WHERE TYP.ACTYPE=MST.ACTYPE AND TYP.ACTYPE=RF.ACTYPE AND RF.FEETYPE='VSDDEP' AND MST.AFACCTNO=strACCTNO
          AND RF.CODEID=strCODEID AND rf.status='A'
          AND MST.ACCTNO=AF.ACCTNO
          AND AF.STATUS IN ('A','P')
          UNION ALL
          SELECT TO_CHar(RF.AUTOID) AUTOID, RF.FORP, RF.FEEAMT, RF.LOTDAY, RF.LOTVAL, RF.ROUNDTYP, 2 ODRNUM,
          ROUND((DECODE(RF.FORP,'P',RF.FEEAMT/100,RF.FEEAMT)/(RF.LOTDAY*RF.LOTVAL)),8) AMT_TEMP
          FROM CIMAST MST, CITYPE TYP, CIFEEDEF RF, AFMAST AF
          WHERE TYP.ACTYPE=MST.ACTYPE AND TYP.ACTYPE=RF.ACTYPE AND RF.FEETYPE='VSDDEP' AND MST.AFACCTNO=strACCTNO
          AND RF.CODEID IS NULL AND (RF.SECTYPE=v_strSECTYPE or RF.SECTYPE=v_strSECTYPEEXT) AND RF.TRADEPLACE=v_strTRADEPLACE
          AND rf.status='A'
          AND MST.ACCTNO=AF.ACCTNO
          AND AF.STATUS IN ('A','P')
          UNION ALL
          SELECT TO_CHar(RF.AUTOID) AUTOID, RF.FORP, RF.FEEAMT, RF.LOTDAY, RF.LOTVAL, RF.ROUNDTYP, 2 ODRNUM,
          ROUND((DECODE(RF.FORP,'P',RF.FEEAMT/100,RF.FEEAMT)/(RF.LOTDAY*RF.LOTVAL)),8) AMT_TEMP
          FROM CIMAST MST, CITYPE TYP, CIFEEDEF RF,AFMAST AF
          WHERE TYP.ACTYPE=MST.ACTYPE AND TYP.ACTYPE=RF.ACTYPE AND RF.FEETYPE='VSDDEP' AND MST.AFACCTNO=strACCTNO
          AND rf.status='A'
          AND MST.ACCTNO=AF.ACCTNO
          AND AF.STATUS IN ('A','P')
          AND RF.CODEID IS NULL AND (RF.SECTYPE=v_strSECTYPE or RF.SECTYPE=v_strSECTYPEEXT) AND RF.TRADEPLACE='000')
  ORDER BY ODRNUM,AMT_TEMP) RFFEE
  WHERE ROWNUM=1;

  IF v_strFORP='P' THEN
    v_dblFEEAMT := v_dblFEEAMT/100;
  END IF;

    v_Result := round (v_dblFEEAMT*dblQTTY*v_dblNUMOFDAYS/(v_dblLOTDAY*v_dblLOTVAL),4);

    RETURN v_result;
    */
    RETURN 0;
EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;

 
 
 
 
/