SET DEFINE OFF;
FROM ICCFTYPESCHDMAP TYP, CITYPE CI, ICCFTYPESCHD IC
WHERE TYP.actype=CI.actype AND TYP.REFID=''<$KEYVAL>'' AND TYP.REFID= IC.AUTOID
ORDER BY TYP.AUTOID', 'SA.ICCFTYPESCHDMAP', 'frmICCFTYPESCHDMAP', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');