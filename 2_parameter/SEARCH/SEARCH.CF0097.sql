SET DEFINE OFF;
from Useraflimit USF , AFmast AF,CFmast CF, TLprofiles TL
where AF.acctno =USF.acctno  and AF.custid =CF.custid and USF.TLIDUSER = TL.TLID', 'USERLIMIT', 'frmSATLID', 'TLIDUSER', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');