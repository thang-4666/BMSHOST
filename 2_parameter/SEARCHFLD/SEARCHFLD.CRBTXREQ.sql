SET DEFINE OFF;
WHERE CDTYPE=''CF'' AND CDNAME = ''BANKNAME'' AND LSTODR>0
AND (CDVAL LIKE ''BIDV%'' OR CDVAL LIKE ''BVB%'' OR CDVAL LIKE ''DAB%'' OR CDVAL LIKE ''STB%'')
ORDER BY LSTODR', 'Version', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
UNION SELECT  ''UNHOLD'' VALUE, ''UNHOLD'' DISPLAY FROM DUAL', 'Error description', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');
UNION
SELECT  ''Thành công'' VALUE, ''Thành công'' DISPLAY FROM DUAL
UNION
SELECT  ''Có lỗi'' VALUE, ''Có lỗi'' DISPLAY FROM DUAL', 'Allow approve', 'N', '', '', 'N', '', '', '', 'N', 'N', 'Y');