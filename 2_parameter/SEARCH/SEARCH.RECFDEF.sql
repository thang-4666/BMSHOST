SET DEFINE OFF;
AFSTATUS,
A0.CDCONTENT DESC_REROLE, A1.CDCONTENT DESC_RETYPE,
RF.EFFDATE, RF.EXPDATE,RF.ODRNUM, RF.EFFDAYS, RF.EFFORD
FROM RECFDEF RF, RETYPE TYP, ALLCODE A0, ALLCODE A1,
ALLCODE A2
WHERE A0.CDTYPE=''RE'' AND A0.CDNAME=''REROLE'' AND
A0.CDVAL=TYP.REROLE
AND A2.CDTYPE = ''RE'' AND A2.CDNAME = ''AFSTATUS'' AND
A2.CDVAL = TYP.AFSTATUS
AND A1.CDTYPE=''RE'' AND A1.CDNAME=''RETYPE'' AND
A1.CDVAL=TYP.RETYPE
AND RF.REACTYPE=TYP.ACTYPE AND
 RF.REFRECFLNKID=''<$KEYVAL>''
 ORDER BY EFFDATE, ACTYPE', 'RE.RECFDEF', 'frmRECFDEF', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');