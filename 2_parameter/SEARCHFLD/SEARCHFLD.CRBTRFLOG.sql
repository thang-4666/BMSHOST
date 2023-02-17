SET DEFINE OFF;
WHERE CDTYPE = ''SY'' AND CDNAME = ''TRFCODE'' AND CDUSER=''Y''
ORDER BY LSTODR', 'Trfcode', 'N', '06', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE = ''SY'' AND CDNAME = ''TRFCODE'' AND CDUSER=''Y''
ORDER BY LSTODR', 'Type', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE=''CF'' AND CDNAME = ''BANKNAME'' AND LSTODR>0
AND (CDVAL LIKE ''BIDV%'' OR CDVAL LIKE ''BVB%'' OR CDVAL LIKE ''DAB%'' OR CDVAL LIKE ''STB%'')
ORDER BY LSTODR', 'Bank', 'N', '94', '', 'N', '', '', '', 'N', 'N', 'Y');