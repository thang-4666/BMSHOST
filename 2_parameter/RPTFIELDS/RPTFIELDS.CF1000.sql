SET DEFINE OFF;
SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD= UPPER(''<$TAGFIELD>'')', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL , cdcontent , LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE''
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');