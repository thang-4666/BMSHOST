SET DEFINE OFF;
SELECT a.autoid, a.prcode, a.afacctno,cf.fullname FROM prafmap a, cfmast cf, afmast af
 where a.afacctno=af.acctno and af.custid=cf.custid and a.prcode = ''<$KEYVAL>''', 'PR.PRAFMAP', 'PRAFMAP', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');