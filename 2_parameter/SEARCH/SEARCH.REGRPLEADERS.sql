SET DEFINE OFF;
From regrpleaders rl, cfmast cf
where rl.custid=cf.custid AND RL.STATUS=''A'' AND RL.GRPID = <$KEYVAL> order by rl.autoid', 'RE.REGRPLEADERS', 'frmREGRPLEADERS', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');