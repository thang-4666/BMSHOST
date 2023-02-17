SET DEFINE OFF;
FROM DUAL
UNION ALL
SELECT DA.VALUECD,DA.VALUE,DA.DISPLAY,DA.EN_DISPLAY
FROM
(
    SELECT  SEC.SYMBOL VALUECD, SEC.SYMBOL VALUE,  SEC.SYMBOL||'':''||ISS.FULLNAME DISPLAY, SEC.SYMBOL EN_DISPLAY
    FROM SBSECURITIES SEC, ISSUERS ISS
    WHERE SEC.SECTYPE <> ''004'' AND INSTR(SEC.SYMBOL,''WFT'') = 0
    AND SEC.ISSUERID= ISS.ISSUERID
    ORDER BY SEC.SYMBOL
)DA where 0 = 0', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
and cdtype = ''ST''', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');