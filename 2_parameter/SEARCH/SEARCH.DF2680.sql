SET DEFINE OFF;
SELECT v.*, (v.dfqtty + v.rcvqtty + v.carcvqtty + v.blockqtty)  SENDQTTY
FROM v_getdealinfo v  WHERE  v.status =''N'' and v.dftype=''M''
and  v.dfqtty + v.rcvqtty + v.carcvqtty + v.blockqtty>0 ', 'DFMAST', '', 'v.ACCTNO DESC', '2680', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');