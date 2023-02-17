SET DEFINE OFF;
SELECT re.autoid, re.trftxnum, re.vsdmsgid, re.recustodycd, re.custodycd, re.symbol,
       re.trade, re.blocked, re.vsdmsgdate, re.frbiccode, sb.codeid,
       cf.fullname custname, cf.address, de.fullname frfullname,re.selldaas, re.sellpcod
FROM sereceived re, sbsecurities sb, cfmast cf, deposit_member de
WHERE re.symbol = sb.symbol
  AND re.recustodycd = cf.custodycd
  AND re.frbiccode = de.biccode
  AND re.status = ''P''
', 'SEMAST', '', '', '2275', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');