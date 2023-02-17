SET DEFINE OFF;
FROM (SELECT SYMBOL,IR.fullname ,1 LSTODR
        FROM SBSECURITIES SB,ISSUERS IR
        WHERE IR.ISSUERID =SB.issuerid
        and SB.tradeplace = ''003''
       )
ORDER BY LSTODR, SYMBOL', '', 'BMSC', 'Y', 'Y', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');