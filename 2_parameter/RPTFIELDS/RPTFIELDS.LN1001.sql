SET DEFINE OFF;
        (SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
        UNION SELECT ''GR'' CDVAL, ''Bảo lãnh tiền mua'' CDCONTENT, 0 LSTODR FROM DUAL
        UNION SELECT ''MR'' CDVAL, ''Margin'' CDCONTENT, 1 LSTODR FROM DUAL
        UNION SELECT ''DF'' CDVAL, ''Cầm cố'' CDCONTENT, 2 LSTODR FROM DUAL
        ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
    FROM (
    SELECT ''TGD'' CDVAL,''Tổng Giám Ðốc'' CDCONTENT, 0 LSTODR FROM dual
    union all
    SELECT ''GDCN'' CDVAL,''Giám Ðốc Chi Nhánh'' CDCONTENT, 1 LSTODR FROM dual
    ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
                ', '', 'ALL', 'Y', 'N', 'N', '', '', 'N', 'C', '', '', '', 'AFACCTNO', '##########', '', 'CIMAST_ALL', 'CF', '', 'PV_CUSTODYCD', 'SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD=upper(''<$TAGFIELD>'')
 union all select ''ALL'' FILTERCD  , ''ALL'' value  , ''ALL'' valuecd , ''ALL'' DISPLAY , ''ALL'' EN_DISPLAY , ''ALL'' DESCRIPTION from dual  ORDER BY VALUE DESC

', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL, cdcontent,LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''PRODUCTTYPE'' AND CDVAL IN (''NM'',''QM'')
)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');