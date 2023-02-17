SET DEFINE OFF;
   MST.FULLNAME PROMOTIONNAME, MST.AUTOID ADPROID, MST.FEERATE,
   ''N'' EDITALLOW, (CASE WHEN RF.STATUS = ''P'' THEN ''Y'' ELSE  ''N'' END) APRALLOW,
   ''Y''  DELALLOW, RF.AFACCTNO
FROM ADPRMFEECF RF, CFMAST CF, ALLCODE A1, ADPRMFEEMST MST
WHERE RF.CUSTID=CF.CUSTID AND RF.PROMOTIONID = MST.AUTOID
    AND A1.CDTYPE = ''SA'' AND A1.CDNAME = ''STATUS'' AND RF.STATUS = A1.CDVAL
ORDER BY CF.CUSTODYCD', 'ADPRMFEECF', 'frmADPRMFEECF', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');