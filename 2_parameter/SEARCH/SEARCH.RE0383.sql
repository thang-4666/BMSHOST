SET DEFINE OFF;
REF.custid||REF.ACTYPE LEADREACCTNO, LNK.REACCTNO,LNK.CUSTID, REF.ACTYPE, RE.FULLNAME REFULLNAME, LNK.FRDATE, LNK.TODATE,
REF.FULLNAME GRNAME, REF.GRPLEVEL, A0.CDCONTENT DESC_REROLE, A1.CDCONTENT DESC_RETYPE
FROM REGRPLNK LNK, REGRP REF, CFMAST CFLEADER, CFMAST RE, RETYPE TYP, ALLCODE A0, ALLCODE A1, RECFLNK RF
WHERE REF.AUTOID=LNK.REFRECFLNKID AND REF.CUSTID=CFLEADER.CUSTID AND  SUBSTR(LNK.reacctno,11,4)=TYP.ACTYPE
AND RE.CUSTID=LNK.CUSTID  AND LNK.STATUS=''A''
AND A0.CDTYPE=''RE'' AND A0.CDNAME=''REROLE'' AND A0.CDVAL=TYP.REROLE
AND A1.CDTYPE=''RE'' AND A1.CDNAME=''RETYPE'' AND A1.CDVAL=TYP.RETYPE
AND REF.CUSTID = RF.CUSTID AND (<$BRID> =''0001'' or RF.BRID = <$BRID>)', 'RE.REMAST', '', '', '0383', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTID');