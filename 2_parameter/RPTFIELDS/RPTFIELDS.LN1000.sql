SET DEFINE OFF;
SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (
SELECT ''ALL'' CDVAL, ''All'' CDCONTENT, -1 LSTODR FROM DUAL
union all
SELECT ''BL'' CDVAL,''Hỗ trợ chậm thanh toán tiền mua'' CDCONTENT, 0 LSTODR FROM dual
union all
SELECT ''CL'' CDVAL,''Creditline'' CDCONTENT, 1 LSTODR FROM dual
UNION all
SELECT ''DF'' CDVAL,''Hợp đồng DF'' CDCONTENT, 2 LSTODR FROM dual
) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
    FROM (
    SELECT ''TGD'' CDVAL,''Tổng Giám Đốc'' CDCONTENT, 0 LSTODR FROM dual
    union all
    SELECT ''GDCN'' CDVAL,''Giám Đốc Chi Nhánh'' CDCONTENT, 1 LSTODR FROM dual
    ) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
                ', '', 'ALL', 'Y', 'N', 'N', '', '', 'N', 'C', '', '', '', 'AFACCTNO', '##########', '', 'CIMAST_ALL', 'CF', '', 'PV_CUSTODYCD', 'SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD=upper(''<$TAGFIELD>'')
 union all select ''ALL'' FILTERCD  , ''ALL'' value  , ''ALL'' valuecd , ''ALL'' DISPLAY , ''ALL'' EN_DISPLAY , ''ALL'' DESCRIPTION from dual  ORDER BY VALUE DESC

', '', 'Y', 'C', 'N');
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,0 LSTODR FROM DUAL
UNION ALL
SELECT ''001'' CDVAL ,''Margin'' cdcontent ,1 LSTODR FROM DUAL
UNION ALL
SELECT ''002'' CDVAL ,''T3'' cdcontent ,2 LSTODR FROM DUAL
UNION ALL
SELECT ''003'' CDVAL ,''Thường'' cdcontent ,3 LSTODR FROM DUAL)ORDER BY LSTODR ', '', 'ALL', 'Y', 'N', 'Y', '', 'ALL', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');