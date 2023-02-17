SET DEFINE OFF;
SELECT MST.FEECD, MST.FEENAME, A0.CDCONTENT FORP, A1.CDCONTENT STATUS, MST.FEEAMT, MST.FEERATE, MST.MINVAL, MST.MAXVAL, MST.VATRATE,
(CASE WHEN MST.STATUS IN (''P'') THEN ''Y'' ELSE ''N'' END) APRALLOW
FROM FEEMASTER MST, ALLCODE A0, ALLCODE A1,FEEMAP M
WHERE A0.CDTYPE=''SA'' AND A0.CDNAME=''FORP'' AND A0.CDVAL=MST.FORP AND A1.CDTYPE=''SY'' AND A1.CDNAME=''APPRV_STS''
AND A1.CDVAL=MST.STATUS and MST.FEECD = M.FEECD
AND M.TLTXCD=''2229''  AND STATUS=''A''', 'FEEMASTER2229', 'FEEMASTER2229', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');