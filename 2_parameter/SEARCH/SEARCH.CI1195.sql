SET DEFINE OFF;
SELECT autoid, c.custodycd, acctno,cf.fullname,b.glaccount, c.amt, c.description, c.refnum, c.txdate, c.status, c.errordesc,
b.bankacctno, c.fileid,cf.idcode, cf.idplace, cf.iddate, cf.address, c.deltd,b.glaccount glmast, c.bankid
FROM tblcashdeposit c, cfmast cf, banknostro b
WHERE c.custodycd = cf.custodycd(+) AND c.bankid = b.shortname(+) AND c.tltxcd = ''1195''
', 'CIMAST', '', '', '1195', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');