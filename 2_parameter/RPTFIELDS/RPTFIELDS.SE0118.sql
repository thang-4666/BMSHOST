SET DEFINE OFF;
 FROM 
 (  SELECT SYMBOL,IR.FULLNAME ,1 LSTODR 
    FROM SBSECURITIES SB,ISSUERS IR 
    WHERE IR.ISSUERID =SB.ISSUERID
    AND SB.TRADEPLACE = ''003'')
 ORDER BY SYMBOL', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');