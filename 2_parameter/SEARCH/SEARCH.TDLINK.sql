SET DEFINE OFF;
FROM TDLINK LNK, AFMAST AF, CFMAST CF WHERE LNK.DELTD<>''Y'' AND LNK.ACCTNO=''<$KEYVAL>'' AND LNK.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID GROUP BY LNK.ACCTNO, LNK.AFACCTNO', 'TD.TDLINK', 'frmTDLINK', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');