SET DEFINE OFF;
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''IC'' VALUECD, ''IC'' VALUE, ''Cá nhân trong nước'' DISPLAY FROM DUAL
UNION ALL
SELECT ''BC'' VALUECD, ''BC'' VALUE, ''Tổ chức trong nước'' DISPLAY FROM DUAL
UNION ALL
SELECT ''IF'' VALUECD, ''IF'' VALUE, ''Cá nhân nước ngoài'' DISPLAY FROM DUAL
UNION ALL
SELECT ''BF'' VALUECD, ''BF'' VALUE, ''Tổ chức nước ngoài'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''001'' VALUECD, ''001'' VALUE, ''T?i BMSC'' DISPLAY FROM DUAL
UNION ALL
SELECT ''002'' VALUECD, ''002'' VALUE, ''Luu ký noi khác'' DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''NB'' VALUECD, ''NB'' VALUE, ''Mua'' DISPLAY FROM DUAL
UNION ALL
SELECT ''NS'' VALUECD, ''NS'' VALUE, ''Bán'' DISPLAY FROM DUAL
UNION ALL
SELECT ''MS'' VALUECD, ''MS'' VALUE, ''Bán cầm cố'' DISPLAY FROM DUAL
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT CDVAL VALUE, CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION, CDCONTENT EN_DESCRIPTION
FROM (SELECT CDVAL, CDCONTENT, LSTODR FROM ALLCODE WHERE CDTYPE = ''OD'' AND CDNAME = ''MATCHTYPE''
      UNION
      SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL)
ORDER BY LSTODR
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT CDVAL VALUE, CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION, CDCONTENT EN_DESCRIPTION
FROM (SELECT CDVAL, CDCONTENT, LSTODR FROM ALLCODE WHERE CDTYPE = ''OD'' AND CDNAME = ''TRADEPLACE'' AND CDVAL IN (''001'',''002'',''005'')
    UNION SELECT ''999'' CDVAL, ''HOSE + HNX'' CDCONTENT, 0 LSTODR FROM DUAL
      UNION
      SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, -1 LSTODR FROM DUAL)
ORDER BY LSTODR
', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (SELECT CDVAL, CDCONTENT, LSTODR FROM ALLCODE WHERE CDTYPE = ''CF'' AND CDNAME = ''BANKNAME''
      UNION SELECT ''000'' CDVAL, ''Cty chứng khoán'' CDCONTENT, 0 LSTODR FROM DUAL
      UNION SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL
      UNION SELECT ''111'' CDVAL, ''Kết nối ngân hàng'' CDCONTENT, -1 LSTODR FROM DUAL
      ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');
union all
SELECT ''N'' VALUE, ''N'' VALUECD, ''Không'' DISPLAY, ''Không'' EN_DISPLAY FROM DUAL
union all
SELECT ''T'' VALUE, ''T'' VALUECD, ''Có'' DISPLAY, ''Có'' EN_DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
UNION ALL SELECT ''TP'' VALUECD, ''TP'' VALUE, ''Trái phiếu'' DISPLAY FROM DUAL
UNION ALL SELECT ''CP & CCQ'' VALUECD, ''CP & CCQ'' VALUE, ''Cổ phiếu/Chứng chỉ quỹ'' DISPLAY FROM DUAL
UNION ALL SELECT ''CW'' VALUECD, ''CW'' VALUE, ''Chứng quyền'' DISPLAY FROM DUAL', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');
FROM (SELECT to_char(SYMBOL)SYMBOL , to_char(IR.fullname) fullname ,1 LSTODR
FROM SBSECURITIES SB,ISSUERS IR WHERE IR.ISSUERID =SB.issuerid
union all
SELECT ''ALL'' CDVAL ,''ALL'' CDCONTENT, 0 LSTODR FROM dual
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');