SET DEFINE OFF;
            WHEN  country <> ''234'' THEN ''CUSF''
            ELSE '''' END
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');