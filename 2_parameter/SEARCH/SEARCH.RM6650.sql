SET DEFINE OFF;
nt.symbol, nt.isincode, a.cdcontent tradeplace, nt.trade
FROM newstockregister nt, vsdtrfcode vsd ,(SELECT * FROM allcode WHERE cdname =''TRADEPLACE'' AND cdtype =''SE'' )a
WHERE nt.deltd <> ''Y''
AND nt.trfcode = vsd.trfcode
AND nt.tradeplace = a.cdval (+)', 'CAMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');