SET DEFINE OFF;
WHERE CDTYPE = ''SY'' AND CDNAME = ''TRFCODE'' AND CDUSER=''Y''
ORDER BY LSTODR', 'Trfcode', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE = ''SY'' AND CDNAME = ''TRFCODE'' AND CDUSER=''Y''
ORDER BY LSTODR', 'Type', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE=''CF'' AND CDNAME = ''BANKNAME'' AND LSTODR>0
AND (CDVAL LIKE ''BIDV%'' OR CDVAL LIKE ''BVB%'' OR CDVAL LIKE ''DAB%'' OR CDVAL LIKE ''STB%'')
ORDER BY LSTODR', 'Bank', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
WHERE CDTYPE = ''RM'' AND CDNAME = ''TRFLOGSTS''
ORDER BY LSTODR;', 'Status', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');