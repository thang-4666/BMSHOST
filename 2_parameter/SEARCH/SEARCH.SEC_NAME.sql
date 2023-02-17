SET DEFINE OFF;
    CASE WHEN NVL(LOT.PRICETYPE,''001'') = ''001'' THEN sec.floorprice
    ELSE SEC.basicprice - (SEC.basicprice * NVL(LOT.rate,0)/100) END floorprice, parvalue
FROM SBSECURITIES SB, ISSUERS  ISS  , securities_info sec, seoddlot LOT
WHERE  SB.ISSUERID = ISS.ISSUERID and sb.codeid = sec.codeid
    AND SB.tradeplace = LOT.tradeplace(+) ORDER BY SB.SYMBOL', 'SA.SECURITIES_INFO', 'frmSECURITIES_TICKSIZE', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');