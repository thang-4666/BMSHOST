SET DEFINE OFF;
cf.idtype,tradingcode,TO_CHAR(cf.tradingcodedt,''DD/MM/YYYY'') tradingcodedt,VAT,AL.CDCONTENT SEX ,
 CF.MOBILESMS, CF.MNEMONIC,  CF.FAX,   CF.PROVINCE, CF.COUNTRY, CF.CLASS,
 CF.CUSTTYPE, CF.custatcom ISDEPO
, CF.CAREBY, CF.PIN,    CF.OPNDATE
, CF.tradeonline ISONLINE, CF.tradetelephone, CF.STATUS, A0.CDCONTENT CFSTATUS,
BR.BRNAME, CFT.TYPENAME CFTYPE,cf.TAXCODE,CF.WHTAX
from cfmast cf , tlgroups tl,ALLCODE AL, ALLCODE A0, BRGRP BR,CFTYPE CFT
where cf.careby = tl.grpid
and cf.sex = al.cdval
and al.cdname=''SEX''
and al.cdtype=''CF''
AND A0.CDTYPE=''CF'' AND A0.CDNAME=''STATUS'' AND A0.CDVAL=CF.STATUS
AND CF.BRID=BR.BRID
AND CF.ACTYPE=CFT.ACTYPE', 'AFMAST', '', '', '', NULL, 100, 'N', 30, '', 'Y', 'T', '', 'N', '', 'CUSTID');