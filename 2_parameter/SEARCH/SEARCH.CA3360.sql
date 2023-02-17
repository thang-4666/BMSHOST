SET DEFINE OFF;
SELECT SUBSTR(ca.camastid, 1, 4) || ''.'' || SUBSTR(ca.camastid, 5, 6) || ''.'' || SUBSTR(ca.camastid, 11, 6) camastid, 
       sb.symbol, ca.codeid, ca.isincode, ''0'' vsdmsgid,
       ''Thanh toán chứng quyền, '' || ca.camastid || '', Ngày chốt '' || to_char(ca.reportdate, ''DD/MM/RRRR'') TXDESC
FROM (
   SELECT to_date(varvalue,''dd/mm/yyyy'') currdate FROM sysvar WHERE grname = ''SYSTEM'' AND varname =''CURRDATE''
) sys1, camast ca, sbsecurities sb
WHERE ca.codeid = sb.codeid
  AND ca.catype = ''028''
  AND ca.status IN (''V'')
  AND ca.begindate <= sys1.currdate
  AND NVL(ca.duedate, sys1.currdate + 1) >= sys1.currdate
  AND EXISTS (SELECT 1 FROM caschd WHERE camastid = ca.camastid AND status IN (''V'') AND deltd <> ''Y'' AND balance > 0 AND amt > 0)
', 'SEMAST', '', '', '3360', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');