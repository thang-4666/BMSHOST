SET DEFINE OFF;
(select tltxcd CDVAL, txdesc, en_txdesc , 1 LSTODR from tltx where tltxcd in (''3324'',''3326'',''3350'',''3351'',''3354'',''3356'',''3384'',''3386'')
UNION ALL
SELECT ''ALL'' CDVAL,''ALL'' txdesc, ''ALL'' en_txdesc, -1 LSTODR FROM DUAL)ORDER BY LSTODR , CDVAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');