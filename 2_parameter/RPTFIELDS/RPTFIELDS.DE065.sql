SET DEFINE OFF;
FROM SBSECURITIES SEC, ISSUERS ISS
WHERE SEC.SECTYPE <> ''004'' and instr(SEC.SYMBOL,''WFT'') = 0
AND SEC.issuerid= ISS.issuerid
order by SEC.SYMBOL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM
(
    SELECT MAX(SYMBOL) SYMBOL
    FROM SBSECURITIES
    WHERE SECTYPE <> ''004'' AND INSTR(SYMBOL,''WFT'') = 0
)SE, ISSUERS ISS, SBSECURITIES SEC
WHERE SE.SYMBOL = SEC.SYMBOL
AND SEC.ISSUERID= ISS.ISSUERID
UNION ALL
SELECT *
FROM(
    SELECT SEC.SYMBOL VALUECD, SEC.SYMBOL VALUE, SEC.SYMBOL||'':''||ISS.FULLNAME DISPLAY, SEC.SYMBOL EN_DISPLAY
    FROM SBSECURITIES SEC, ISSUERS ISS
    WHERE SEC.SECTYPE <> ''004'' AND INSTR(SEC.SYMBOL,''WFT'') = 0
    AND SEC.ISSUERID= ISS.ISSUERID
    ORDER BY SEC.SYMBOL
)DA', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
and cdtype = ''ST''', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');