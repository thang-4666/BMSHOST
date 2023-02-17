SET DEFINE OFF;
(select tltxcd CDVAL, txdesc, en_txdesc , 1 LSTODR from tltx where tltxcd in (''2240'',''2241'',''2230'',''2231'',''2246'',''2200'',
''2292'',''2294'',''2201'',''2244'',''2255'',''2266'',''2202'',''2203'',''2293'',''2254'',''2265'',''2220'',''2221'',''2245'',''2232'',''2233'',''2234'',''2235'',''2236'',
''2245'',''2242'',''2251'',''2256'',''2253'',''2257'',''2258'',''2268'',''2263'',''8878'',''8879'',''8815'',''8816'',''8817'',''2247'',''2248'',''2290'',''2262'')
UNION ALL
SELECT ''ALL'' CDVAL,''ALL'' txdesc, ''ALL'' en_txdesc, -1 LSTODR FROM DUAL)ORDER BY LSTODR , CDVAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');
UNION ALL
SELECT ''HCCN'' VALUE, ''HCCN'' VALUECD, ''HCCN'' DISPLAY, ''HCCN'' EN_DISPLAY, ''HCCN'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''CC'' VALUE, ''CC'' VALUECD, ''CC'' DISPLAY, ''CC'' EN_DISPLAY, ''CC'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''TU DO'' VALUE, ''TU DO'' VALUECD, ''TU DO'' DISPLAY, ''TU DO'' EN_DISPLAY, ''TU DO'' DESCRIPTION FROM DUAL
UNION ALL
SELECT ''PHONG TOA'' VALUE, ''PHONG TOA'' VALUECD, ''PHONG TOA'' DISPLAY, ''PHONG TOA'' EN_DISPLAY, ''PHONG TOA'' DESCRIPTION FROM DUAL ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');