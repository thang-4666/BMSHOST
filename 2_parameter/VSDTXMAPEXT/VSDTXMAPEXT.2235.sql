SET DEFINE OFF;
            WHEN country = ''234'' THEN VSD.BICCODE ||''-CUSD''
            WHEN country <> ''234'' THEN VSD.BICCODE ||''-CUSF''
            ELSE '''' END
FROM CFMAST CF,VSDBICCODE VSD, AFMAST AF
WHERE CF.CUSTID = AF.CUSTID 
AND VSD.TRFTYPE =''DR''
AND AF.ACCTNO = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');
            WHEN country = ''234'' THEN VSD.BICCODE ||''-CUSD''
            WHEN country <> ''234'' THEN VSD.BICCODE ||''-CUSF''
            ELSE '''' END
FROM CFMAST CF,VSDBICCODE VSD, AFMAST AF
WHERE CF.CUSTID = AF.CUSTID 
AND VSD.TRFTYPE =''DR''
AND AF.ACCTNO = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');
            WHEN country = ''234'' THEN VSD.BICCODE ||''-CUSD''
            WHEN country <> ''234'' THEN VSD.BICCODE ||''-CUSF''
            ELSE '''' END
FROM CFMAST CF,VSDBICCODE VSD, AFMAST AF
WHERE CF.CUSTID = AF.CUSTID 
AND VSD.TRFTYPE =''DR''
AND AF.ACCTNO = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');
            WHEN country = ''234'' THEN VSD.BICCODE ||''-CUSD''
            WHEN country <> ''234'' THEN VSD.BICCODE ||''-CUSF''
            ELSE '''' END
FROM CFMAST CF,VSDBICCODE VSD, AFMAST AF
WHERE CF.CUSTID = AF.CUSTID 
AND VSD.TRFTYPE =''DR''
AND AF.ACCTNO = ''<$FILTERID>''', 'Loại khách hàng', '', '', '', 1233219999, '', '');