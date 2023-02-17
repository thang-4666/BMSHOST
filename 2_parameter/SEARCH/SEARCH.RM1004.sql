SET DEFINE OFF;
select cf.custodycd, cf.fullname, cf.idcode, af.bankname, af.bankacctno, blog.amount, blog.reftype, blog.refchk, blog.txdate, blog.txtime, blog.refno
from bidvwarningholdlog blog, afmast af, cfmast cf
where blog.bankacctno = af.bankacctno
and af.custid = cf.custid
', 'RMMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');