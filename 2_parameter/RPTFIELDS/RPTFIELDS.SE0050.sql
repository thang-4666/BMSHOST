SET DEFINE OFF;
(select tltxcd CDVAL, txdesc, en_txdesc , 1 LSTODR from tltx where tltxcd in (''2200'',''2240'',''2244'')
UNION ALL
SELECT ''ALL'' CDVAL,''ALL'' txdesc, ''ALL'' en_txdesc, -1 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');