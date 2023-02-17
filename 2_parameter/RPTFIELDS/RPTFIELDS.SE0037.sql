SET DEFINE OFF;
FROM (SELECT to_char(SYMBOL)SYMBOL , to_char(IR.fullname) fullname ,1 LSTODR
FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid
union all
SELECT ''ALL'' CDVAL ,''ALL'' CDCONTENT, 0 LSTODR FROM dual
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
UNION ALL
SELECT ''CHI NHÁNH TRUNG TÂM LƯU KÝ CHỨNG KHOÁN VIỆT NAM'' VALUECD, ''CHI NHÁNH TRUNG TÂM LƯU KÝ CHỨNG KHOÁN VIỆT NAM'' VALUE, ''CHI NHÁNH TRUNG TÂM LƯU KÝ CHỨNG KHOÁN VIỆT NAM'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
(SELECT DISTINCT NVL(FLD.CVALUE,'' '') ACCNUM FROM VW_TLLOG_ALL TL, VW_TLLOGFLD_ALL FLD, AFMAST AF, CFMAST CF,SBSECURITIES SB
WHERE TL.TXDATE=FLD.TXDATE AND TL.TXNUM=FLD.TXNUM AND FLD.FLDCD=''13'' AND TL.TLTXCD=''2232''
AND AF.ACCTNO=SUBSTR(TL.MSGACCT,1,10) AND AF.CUSTID=CF.CUSTID AND SB.CODEID=SUBSTR(TL.MSGACCT,11,6) AND CF.CUSTODYCD=upper(''<$TAGFIELD>''))
ORDER BY FILTERCD', '', 'Y', 'C', 'N');