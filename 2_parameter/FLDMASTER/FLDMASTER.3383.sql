SET DEFINE OFF;
from
(
SELECT FILTERCD, VALUE, VALUECD, DISPLAY, EN_DISPLAY, DESCRIPTION FROM VW_CUSTODYCD_SUBACCOUNT_ACTIVE
WHERE FILTERCD = UPPER(''<$TAGFIELD>'')
union all
SELECT ''-----'' FILTERCD, ''-----'' VALUE, ''-----'' VALUECD,''-----'' DISPLAY,''-----'' EN_DISPLAY,''-----'' DESCRIPTION
FROM dual
/*where UPPER(''<$TAGFIELD>'') not like ''002%''*/
where not exists (select * from cfmast where custodycd=UPPER(''<$TAGFIELD>''))
)
order by VALUE', 'N', 'P_TOAFACCTNO', 'Y', '', 'N', '', '', '', 'N');
union all
SELECT ''777777'' VALUECD, ''777777'' VALUE, ''Nhập tay'' DISPLAY, ''Nhập tay'' EN_DISPLAY, ''Nhập tay'' DESCRIPTION from dual', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'ACNAME', '##########', '', '', '', '', 'T', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');
union all
SELECT  ''N'' VALUECD, ''N'' VALUE, ''Không'' DISPLAY, ''No'' EN_DISPLAY, ''Không'' DESCRIPTION FROM dual', '', 'Y', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');