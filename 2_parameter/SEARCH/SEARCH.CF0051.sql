SET DEFINE OFF;
    tradeonline,af.mrcrlimitmax,cf.vat,
    cf.careby carebyid , tl.grpname carebyname , aft.actype ,aft.typename,
    cf.custatcom, af.corebank, af.bankname, af.bankacctno, af.status,cf.idtype
from cfmast cf ,afmast af , aftype aft,  tlgroups tl
where cf.careby = tl.grpid
and af.custid = cf.custid and af.actype =aft.actype', 'AFMAST', '', '', '', NULL, 100, 'N', 30, '', 'Y', 'T', '', 'N', '', 'CUSTID');