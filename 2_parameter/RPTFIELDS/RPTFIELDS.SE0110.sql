SET DEFINE OFF;
FROM (SELECT CODEID, SYMBOL ,SYMBOL LSTODR FROM SBSECURITIES WHERE TRADEPLACE = ''003''
UNION ALL SELECT ''ALL'' CODEID ,''ALL'' SYMBOL ,''-1'' LSTODR FROM DUAL) ORDER BY LSTODR, SYMBOL', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');