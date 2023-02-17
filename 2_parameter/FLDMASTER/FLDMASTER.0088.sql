SET DEFINE OFF;
SELECT ''<$TAGFIELD>'' FILTERCD, ''<$TAGFIELD>'' || ''|ALL'' VALUE, ''<$TAGFIELD>'' || ''|ALL'' VALUECD, ''ALL''  DISPLAY, ''ALL'' EN_DISPLAY,''ALL'' DESCRIPTION
FROM  dual
Union
(SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION
FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD=''<$TAGFIELD>'')
) order by (case when value=''ALL'' then ''0'' else ''1''|| VALUE end)', 'N', 'P_ACCOUNT', 'Y', '', 'N', '', '', '', 'N');
FROM FEEMASTER FE, FEEMAP FM WHERE FE.FEECD = FM.FEECD AND FM.TLTXCD =''0088'' ', ' ', '0008', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CDVAL', '##########', '', '', '', '', 'M', 'N', 'MAIN', '37', '[01]', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');
UNION ALL
SELECT ''02'' VALUECD, ''02'' VALUE,''Nhập tay''  DISPLAY,''Nhập tay''  EN_DISPLAY,''Nhập tay''  DESCRIPTION FROM dual ', ' ', '01', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CDVAL', '##########', '', '', '', '', 'M', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
FROM FEEMASTER FE, FEEMAP FM WHERE FE.FEECD = FM.FEECD AND FM.TLTXCD =''0088'' ', ' ', '0008', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CDVAL', '##########', '', '', '', '', 'M', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');
SELECT ''<$TAGFIELD>'' FILTERCD, ''<$TAGFIELD>'' || ''|Không cùng công ty'' VALUE, ''<$TAGFIELD>'' || ''|Không cùng công ty'' VALUECD,
 ''<$TAGFIELD>''  DISPLAY, ''<$TAGFIELD>'' EN_DISPLAY,''<$TAGFIELD>'' DESCRIPTION
FROM  dual
Union
(SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION
FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD=''<$TAGFIELD>'')
) order by (case when value=''<$TAGFIELD>'' then ''1'' else ''0''|| VALUE end)', 'N', 'P_RCVAFACCT', 'Y', '', 'N', '', '', '', 'N');