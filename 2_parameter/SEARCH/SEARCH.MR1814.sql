SET DEFINE OFF;
nvl(AF.mrcrlimitmax,0) mrcrlimitmax, AF.acctno,
AFT.TYPENAME,aft.mnemonic,
nvl(AF.mrcrlimitmax,0) avlmrlimit
from cfmast cf, afmast af,   aftype aft
where cf.custid = af.custid
and nvl(AF.mrcrlimitmax,0) > 0
AND af.actype = aft.actype', 'MRTYPE', 'frmSATLID', 'custid', '1814', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');