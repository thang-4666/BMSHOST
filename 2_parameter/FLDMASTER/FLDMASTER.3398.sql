SET DEFINE OFF;
from
(
SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD=''<$TAGFIELD>''
union all
SELECT ''-----'' FILTERCD, ''-----'' VALUE, ''-----'' VALUECD,''-----'' DISPLAY,''-----'' EN_DISPLAY,''-----'' DESCRIPTION
FROM dual
where ''<$TAGFIELD>'' not like ''002%''
)
order by VALUE', 'N', 'P_AFACCT2', 'Y', '', 'N', '', '', '', 'N');
from
(
SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE WHERE FILTERCD=''<$TAGFIELD>''
union all
SELECT ''-----'' FILTERCD, ''-----'' VALUE, ''-----'' VALUECD,''-----'' DISPLAY,''-----'' EN_DISPLAY,''-----'' DESCRIPTION
FROM dual
where ''<$TAGFIELD>'' not like ''002%''
)
order by VALUE', 'N', 'P_TOAFACCTNO', 'Y', '', 'N', '', '', '', 'N');