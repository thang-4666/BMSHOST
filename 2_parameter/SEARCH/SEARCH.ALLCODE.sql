SET DEFINE OFF;
SELECT MST.CDTYPE, MST.CDVAL, MST.CDNAME, MST.CDCONTENT, MST.EN_CDCONTENT, MST.CDUSER,
    MST.LSTODR,
    ''Y'' EDITALLOW,
    ''Y'' DELALLOW,
    (CASE WHEN MST.CHSTATUS IN (''A'',''E'',''D'') THEN ''Y'' ELSE ''N'' END) APRALLOW ,
    A1.CDCONTENT STATUS
FROM ALLCODE MST , ALLCODE A1
WHERE A1.CDTYPE=''SA'' AND A1.CDNAME=''CHSTATUS''
    AND MST.CDNAME = ''TLGROUP'' AND MST.CDTYPE = ''SA''
AND A1.CDVAL=NVL(MST.CHSTATUS,''C'')', 'ALLCODE', 'frmALLCODE', '', '', 0, 50, 'N', 30, 'YYYNYYYNNNY', 'Y', 'T', '', 'N', '', '');