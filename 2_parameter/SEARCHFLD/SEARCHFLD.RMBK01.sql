SET DEFINE OFF;
WHERE CDTYPE = ''SY'' AND CDNAME = ''TRFCODE'' AND CDUSER=''Y''
ORDER BY LSTODR', 'Transfer Code', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE = ''SY'' AND CDNAME = ''TRFCODE'' AND CDUSER=''Y''
ORDER BY LSTODR', 'Transfer Name', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE=''CF'' AND CDNAME = ''BANKNAME'' AND LSTODR>0
AND (CDVAL LIKE ''BIDV%'' OR CDVAL LIKE ''BVB%'' OR CDVAL LIKE ''DAB%'' OR CDVAL LIKE ''STB%'')
ORDER BY LSTODR', 'Bank Code', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE=''CF'' AND CDNAME = ''BANKNAME'' AND LSTODR>0
AND (CDVAL LIKE ''BIDV%'' OR CDVAL LIKE ''BVB%'' OR CDVAL LIKE ''DAB%'' OR CDVAL LIKE ''STB%'')
ORDER BY LSTODR', 'Bank Name', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');