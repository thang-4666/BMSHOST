SET DEFINE OFF;
(select tltxcd CDVAL, txdesc, en_txdesc , 1 LSTODR from tltx where tltxcd in (''2240'',''2230'',''2241'',''2231'',''2246'')
UNION ALL
SELECT ''ALL'' CDVAL,''ALL'' txdesc, ''ALL'' en_txdesc, -1 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');