SET DEFINE OFF;
(CASE WHEN SEC.TRADEPLACE =''002'' THEN SEINFO.FLOORPRICE ELSE SEINFO.BASICPRICE*(1-(10/100)) END )RETAILPRICE
 FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO WHERE SEC.CODEID=SEINFO.CODEID and sec.SECTYPE <>''004'' ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', 'SEC_NAME', 'SA', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');