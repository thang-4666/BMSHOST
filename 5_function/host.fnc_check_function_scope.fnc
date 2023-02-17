SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fnc_check_function_scope
(
PV_KEYFIELD in varchar,
pv_KEYVAL IN Varchar2,
V_TELLERBRID IN Varchar2,
v_TLID IN Varchar2,
v_CMDID IN Varchar2
)
RETURN  NUMBER IS
  v_Return number;
  v_BrID varchar2(20);
  v_CareByID varchar2(20);
  v_LevelScope number;
  v_Count number;
  --v_CUSTODYCD varchar2(20);
  v_Keyval varchar2(20);
BEGIN
v_Return:=-1;
v_Keyval:=REPLACE(pv_KEYVAL,'.','' );

--v_CUSTODYCD :=  REPLACE(pv_CUSTODYCD,'.','' );
--Neu la User Admin thi khong can check
IF v_TLID='0001' THEN
    RETURN 0;
END IF;

SELECT COUNT(LEVSCOPE) INTO v_Count FROM
(SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A
WHERE C.CMDTYPE<>'T' AND C.CMDCODE=v_CMDID AND C.AUTHTYPE='U' AND C.AUTHID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE
UNION ALL
SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A, TLGRPUSERS T
WHERE C.CMDTYPE<>'T' AND C.CMDCODE=v_CMDID AND C.AUTHTYPE='G' AND C.AUTHID=T.GRPID AND T.TLID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE);

IF v_Count=0 THEN
  RETURN 0;
END IF;

--v_LevelScope: 0: ALL, 1: REGION, 2: BRANCH, 3: SUB-BRANCH, 4: CARE-BY
SELECT MIN(LEVSCOPE) INTO v_LevelScope FROM
(SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A
WHERE C.CMDTYPE<>'T' AND C.CMDCODE=v_CMDID AND C.AUTHTYPE='U' AND C.AUTHID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE
UNION ALL
SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A, TLGRPUSERS T
WHERE C.CMDTYPE<>'T' AND C.CMDCODE=v_CMDID AND C.AUTHTYPE='G' AND C.AUTHID=T.GRPID AND T.TLID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE);

IF v_LevelScope=0 THEN
  RETURN  0;
END IF;

--L?y th?tin kh? h?
--SELECT BRID, CAREBY INTO v_BrID, v_CareByID FROM CFMAST WHERE CUSTODYCD=v_CUSTODYCD;
if PV_KEYFIELD='CUSTODYCD' then
    SELECT BRID, CAREBY INTO v_BrID, v_CareByID FROM CFMAST WHERE CUSTODYCD=v_Keyval;
elsif PV_KEYFIELD='AFACCTNO' then
    SELECT cf.BRID, cf.CAREBY INTO v_BrID, v_CareByID FROM CFMAST cf, afmast af WHERE cf.custid = af.custid and af.acctno = v_Keyval;
elsif PV_KEYFIELD='CUSTID' then
    SELECT cf.BRID, cf.CAREBY INTO v_BrID, v_CareByID FROM CFMAST cf WHERE cf.custid = v_Keyval;
elsif PV_KEYFIELD='SEACCTNO' then
    SELECT cf.BRID, cf.CAREBY INTO v_BrID, v_CareByID FROM CFMAST cf, semast se WHERE cf.custid = se.custid and se.acctno = v_Keyval;
else
    RETURN 0; --Khong check
end if;

IF (v_LevelScope=3 OR v_LevelScope=2)  AND v_BrID=v_TellerBrID THEN
  RETURN 0;
END IF;

IF v_LevelScope=2 AND SUBSTR(v_BrID,1,2) || '01'=v_TellerBrID THEN
  RETURN 0;
END IF;

IF v_LevelScope=4 THEN
  BEGIN
    SELECT COUNT(*) INTO v_Count FROM TLGRPUSERS WHERE GRPID=v_CareByID AND TLID=v_TLID;
    IF v_Count>0 THEN
      RETURN 0;
    END IF;
    END;
END IF;

IF v_LevelScope=1 THEN
  BEGIN
    IF v_TellerBrID=v_BrID THEN
        RETURN 0;
    END IF;

    SELECT COUNT(*) INTO v_Count
    FROM BRRGMASTER M, BRRGDETAIL D
    WHERE M.AUTOID=D.REFID AND M.BRID=v_TellerBrID AND D.BRID=v_BrID;
    IF v_Count>0 THEN
      RETURN 0;
    END IF;
    END;
END IF;

RETURN v_Return;
END;

 
 
 
 
/