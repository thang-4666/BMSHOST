SET DEFINE OFF;
    SEINFO.BASICPRICE REFPRICE, SEINFO.CEILINGPRICE, SEINFO.FLOORPRICE
     FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO
      WHERE SEC.CODEID=SEINFO.CODEID
        AND SEC.SECTYPE IN (''001'',''006'',''008'') AND instr(sec.symbol,''WFT'') = 0
      ORDER BY SEC.SYMBOL', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', '', 'Y', '', 'N', '', '', '', 'N');