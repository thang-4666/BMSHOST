SET DEFINE OFF;
WHERE CDTYPE = ''CF'' AND CDNAME = ''CUSTTYPE'' and cduser=''Y'' ORDER BY lstodr ', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
SELECT  ACTYPE VALUECD, ACTYPE VALUE,ACTYPE || '': '' || TYPENAME DISPLAY,ACTYPE || '': '' || TYPENAME EN_DISPLAY,ACTYPE || '': '' || TYPENAME DESCRIPTION
FROM CFTYPE WHERE STATUS=''Y''
', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
UNION ALL
SELECT  ACTYPE VALUECD, ACTYPE VALUE,ACTYPE || '': '' || TYPENAME DISPLAY,ACTYPE || '': '' || TYPENAME EN_DISPLAY,ACTYPE || '': '' || TYPENAME DESCRIPTION
FROM CFTYPE WHERE STATUS=''Y'' AND isdefault =''Y''
', '', '', 'Y', 'N', 'N', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');