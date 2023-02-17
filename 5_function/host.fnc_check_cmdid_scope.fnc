SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fnc_check_cmdid_scope
(
v_CMDID IN Varchar2,
V_CMDTYPE IN Varchar2,
v_TLID IN Varchar2
)
RETURN VARCHAR2 IS
    v_LevelScope number;
    v_Count number;
    v_Scope varchar2(20);
BEGIN

--> theo allcode thi C la scope theo careby RIGHTSCOPE  C   Nh�.l� KH    4   N   Care-By
return 'C';

IF v_TLID='0001' THEN
    RETURN 'A'; --ALL
END IF;

SELECT COUNT(LEVSCOPE) INTO v_Count FROM
(SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A
WHERE /*C.CMDTYPE=V_CMDTYPE AND */C.CMDCODE=v_CMDID AND C.AUTHTYPE='U' AND C.AUTHID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE
UNION ALL
SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A, TLGRPUSERS T
WHERE /*C.CMDTYPE=V_CMDTYPE AND*/ C.CMDCODE=v_CMDID AND C.AUTHTYPE='G' AND C.AUTHID=T.GRPID AND T.TLID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE);

IF v_Count=0 THEN
    RETURN 'N'; --DO NOT HAVE ACCESS RIGHT
END IF;

--v_LevelScope: 0: ALL, 1: REGION, 2: BRANCH, 3: SUB-BRANCH, 4: CARE-BY
SELECT MIN(LEVSCOPE) INTO v_LevelScope FROM
(SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A
WHERE /*C.CMDTYPE=V_CMDTYPE AND */C.CMDCODE=v_CMDID AND C.AUTHTYPE='U' AND C.AUTHID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE
UNION ALL
SELECT A.LSTODR LEVSCOPE
FROM CMDAUTH C, ALLCODE A, TLGRPUSERS T
WHERE /*C.CMDTYPE=V_CMDTYPE AND*/ C.CMDCODE=v_CMDID AND C.AUTHTYPE='G' AND C.AUTHID=T.GRPID AND T.TLID=v_TLID
AND A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.CDVAL=C.RIGHTSCOPE);

SELECT A.CDVAL INTO v_Scope
FROM ALLCODE A WHERE A.CDTYPE='SY' AND A.CDNAME='RIGHTSCOPE' AND A.LSTODR=v_LevelScope;

RETURN v_Scope;
END;
 
 
 
 
/