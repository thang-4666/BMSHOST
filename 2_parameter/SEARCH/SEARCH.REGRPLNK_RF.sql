SET DEFINE OFF;
RF.GRPLEVEL, A0.CDCONTENT DESC_STATUS, RF.CUSTID, RF.EFFDATE, RF.EXPDATE,
RF.FULLNAME || '': '' || CF.FULLNAME RETVALUE, RF.ACTYPE,
SP_FORMAT_REGRP_MAPCODE(RF.AUTOID) MAPCODE, SP_FORMAT_REGRP_GRPLEVEL(RF.AUTOID) MAPLEVEL
FROM REGRP RF, CFMAST CF, ALLCODE A0
WHERE A0.CDTYPE=''RE'' AND A0.CDNAME=''STATUS'' AND A0.CDVAL=RF.STATUS AND RF.CUSTID=CF.CUSTID
AND RF.CUSTID=CF.CUSTID AND RF.STATUS=''A''', 'REGRPLNK', 'frmRECFLNK', 'FULLNAME', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');