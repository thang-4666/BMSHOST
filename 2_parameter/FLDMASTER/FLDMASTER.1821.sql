SET DEFINE OFF;
SELECT  SEC.CODEID VALUECD, SEC.CODEID VALUE, TO_CHAR(SEC.SYMBOL) DISPLAY,
TO_CHAR(SEC.SYMBOL) EN_DISPLAY, TO_CHAR(SEC.SYMBOL) DESCRIPTION
FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
WHERE SEC.CODEID=SEINFO.CODEID
UNION
SELECT ''AAAAAA'' VALUECD,''AAAAAA'' VALUE,''SelectAll'' DISPLAY,''SelectAll'' EN_DISPLAY,'' SelectAll '' DESCRIPTION
FROM DUAL)
ORDER BY DESCRIPTION', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');