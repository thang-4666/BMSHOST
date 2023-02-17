SET DEFINE OFF;
SELECT ''<$TAGFIELD>'' FILTERCD, ''ALL'' VALUE, ''ALL'' VALUECD, ''ALL''  DISPLAY, ''ALL'' EN_DISPLAY,''ALL'' DESCRIPTION
FROM  dual
Union
(SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION
FROM vw_custodycd_subaccount WHERE FILTERCD=''<$TAGFIELD>'')
) order by (case when value=''ALL'' then ''0'' else ''1''|| VALUE end)', 'N', 'P_ACCTNO', 'Y', '', 'N', '', '', '', 'N');