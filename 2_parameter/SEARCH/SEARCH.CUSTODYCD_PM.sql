SET DEFINE OFF;
cf.IDCODE, cf.IDDATE, cf.IDPLACE, cf.ADDRESS, cf.ACTYPE, cft.typename
FROM cfmast cf, cftype cft WHERE SUBSTR(cf.custodycd, 4,1) = ''P''  AND cf.actype = cft.actype', 'CUSTODYCD_PM', '', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');