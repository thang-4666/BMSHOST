SET DEFINE OFF;
(case when CF.CUSTODYCD is null then '''' else format_custodycd(CF.CUSTODYCD) end) CUSTODYCD,
(case when CF.CUSTODYCD is null then '''' else (CF.CUSTODYCD) end) CUSTODYCD_SRCH,
CF.SHORTNAME,CF.FULLNAME,CF.DATEOFBIRTH,CF.IDCODE,CF.IDDATE,CF.IDPLACE,CF.ADDRESS
FROM CFMAST CF WHERE CF.ISBANKING=''Y''', 'CFBANK_TX', '', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');