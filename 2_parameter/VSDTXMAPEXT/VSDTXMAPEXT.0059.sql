SET DEFINE OFF;
            WHEN country = ''234'' THEN VSD.BICCODE ||''-CUSD''
            WHEN country <> ''234'' THEN VSD.BICCODE ||''-CUSF''
            ELSE '''' END
FROM CFMAST CF,VSDBICCODE VSD 
WHERE VSD.TRFTYPE =''DR''
AND CF.CUSTODYCD=''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');