SET DEFINE OFF;
select cf.custodycd, cf.fullname, cf.idcode, af.bankname, af.bankacctno, blog.amount, blog.reftype, blog.txdate, blog.bankcode, blog.refno, BLOG.STATUS
from bidvtranlog blog, afmast af, cfmast cf
where blog.bankacctno = af.bankacctno
and af.custid = cf.custid
', 'RMMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');