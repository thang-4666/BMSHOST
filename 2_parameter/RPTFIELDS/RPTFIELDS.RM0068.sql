SET DEFINE OFF;
SELECT BANKCODE VALUECD, BANKCODE VALUE, BANKNAME DISPLAY, BANKNAME EN_DISPLAY FROM CRBDEFBANK
ORDER BY VALUECD', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''Tất cả'' DISPLAY, ''ALL'' EN_DISPLAY FROM DUAL
UNION ALL
SELECT ''001'' VALUECD, ''001'' VALUE, ''Khách hàng trong nước'' DISPLAY, ''Domestic customers'' EN_DISPLAY FROM DUAL
UNION ALL
SELECT ''002'' VALUECD, ''002'' VALUE, ''Khách hàng nước ngoài'' DISPLAY, ''Foreign customers'' EN_DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
UNION ALL
SELECT ''001'' VALUECD, ''001'' VALUE, ''Ðầu ngày'' DISPLAY, ''Begin of day'' EN_DISPLAY FROM DUAL
UNION ALL
SELECT ''002'' VALUECD, ''002'' VALUE, ''Cuối ngày'' DISPLAY, ''End of day'' EN_DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');