SET DEFINE OFF;
            WHEN  country <> ''234'' THEN ''CUSF''
            ELSE '''' END
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', NULL, '', '');
       WHEN CUSTTYPE = ''B'' AND country = ''234'' THEN ''INV-DO'' WHEN CUSTTYPE = ''B'' AND country <> ''234'' THEN ''INV-FO''
       ELSE '''' END
       FROM CFMAST
       WHERE CUSTID = ''<$FILTERID>''', 'Loại đối tượng', '', '', '', 1233219999, '', '');
       WHEN  CUSTTYPE = ''I'' AND country <> ''234'' THEN ''FIND''
       WHEN  CUSTTYPE = ''B'' AND country = ''234'' THEN ''DNOT'' 
       WHEN  CUSTTYPE = ''B'' AND country <> ''234'' THEN ''DNOT''
       ELSE '''' END
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''', 'Loại tổ chức', '', '', '', 1233219999, '', '');
FROM CFMAST, allcode
WHERE CUSTID = ''<$FILTERID>'' and cdname = ''NATIONAL'' and cdval = country
', 'Quốc tịch', '', '', '', 1233219999, '', '');
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''
', 'Mã số thuế', '', '', '', 1233219999, '', '');
from cfmast where custid =''<$FILTERID>''', 'Ngày cấp', '', '', '', 1233219999, '', '');
                   WHEN ''002'' THEN ''5''
                   WHEN ''003'' THEN ''4''
                   WHEN ''010'' THEN ''4''
                   WHEN ''005'' THEN ''3''
                   WHEN ''006'' THEN ''4''
                   WHEN ''009'' THEN ''2''
       ELSE ''4'' END
FROM CFMAST WHERE CUSTID=''<$FILTERID>''', 'Loại giấy tờ', '', '', '', 1233219999, '', '');
            WHEN  country <> ''234'' THEN ''CUSF''
            ELSE '''' END
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');
       WHEN CUSTTYPE = ''B'' AND country = ''234'' THEN ''INV-DO'' WHEN CUSTTYPE = ''B'' AND country <> ''234'' THEN ''INV-FO''
       ELSE '''' END
       FROM CFMAST
       WHERE CUSTID = ''<$FILTERID>''', 'Loại đối tượng', '', '', '', 1233219999, '', '');
       WHEN  CUSTTYPE = ''I'' AND country <> ''234'' THEN ''FIND''
       WHEN  CUSTTYPE = ''B'' AND country = ''234'' THEN ''DNOT''
       WHEN  CUSTTYPE = ''B'' AND country <> ''234'' THEN ''DNOT''
       ELSE '''' END
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''', 'Loại tổ chức', '', '', '', 1233219999, '', '');
FROM CFMAST, allcode
WHERE CUSTID = ''<$FILTERID>'' and cdname = ''NATIONAL'' and cdval = country
', 'Quốc tịch', '', '', '', 1233219999, '', '');
FROM CFMAST
WHERE CUSTID = ''<$FILTERID>''
', 'Mã số thuế', '', '', '', 1233219999, '', '');
from cfmast where custid =''<$FILTERID>''', 'Ngày cấp', '', '', '', 1233219999, '', '');
                   WHEN ''002'' THEN ''5''
                   WHEN ''003'' THEN ''4''
                   WHEN ''010'' THEN ''4''
                   WHEN ''005'' THEN ''3''
                   WHEN ''006'' THEN ''4''
                   WHEN ''009'' THEN ''2''
       ELSE ''4'' END
FROM CFMAST WHERE CUSTID=''<$FILTERID>''', 'Loại giấy tờ', '', '', '', 1233219999, '', '');