SET DEFINE OFF;
''Corebank'' EN_DISPLAY, ''Corebank'' DESCRIPTION
FROM Dual
union
SELECT ''N'' VALUE, ''N'' VALUECD, ''BSC'' DISPLAY, ''ECC''
EN_DISPLAY, ''ECC'' DESCRIPTION
FROM Dual
union
SELECT ''ALL'' VALUE, ''ALL'' VALUECD, ''ALL'' DISPLAY, ''ALL''
EN_DISPLAY, ''ALL'' DESCRIPTION
FROM Dual', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
 SELECT ''ALL'' VALUECD, ''ALL'' VALUE ,''ALL'' DISPLAY, -2 LSTODR FROM DUAL
 UNION ALL
 SELECT  CDVAL VALUECD, CDVAL VALUE, CDCONTENT DISPLAY, LSTODR FROM
 ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''BANKNAME'') ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');