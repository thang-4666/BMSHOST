SET DEFINE OFF;
  case when CF.CUSTODYCD is null then '''' else format_custodycd(CF.CUSTODYCD) end CUSTODYCD,
    case when CF.CUSTODYCD is null then '''' else (CF.CUSTODYCD) end CUSTODYCD_SRCH,
  CF.SHORTNAME,CF.FULLNAME,CF.DATEOFBIRTH,CF.IDCODE,CF.IDDATE,CF.IDPLACE,CF.ADDRESS, mrloanlimit, cf.username,
  nvl(usl.tokenid,'''') tokenid, nvl(usl.ismaster,''N'') ismaster, nvl(usl.authtype,'''') authtype,
  A1.CDCONTENT CUSTTYPE,CF.EMAIL, CF.PHONE,CF.MOBILE,NVL(CF.PIN,'''') PIN
FROM CFMAST CF, TLGROUPS GRP,  AFMAST AF, userlogin usl, ALLCODE A1
WHERE  CF.CUSTID=AF.CUSTID
AND AF.CAREBY = GRP.GRPID
AND NVL( USL.status,''A'') = ''A''
AND A1.CDNAME = ''CUSTTYPE'' AND A1.CDTYPE = ''CF'' AND A1.CDVAL = CF.CUSTTYPE
AND cf.username = usl.username (+)
AND (SUBSTR(CF.CUSTID,1,4) = DECODE(''<$BRID>'', ''<$HO_BRID>'', SUBSTR(CF.CUSTID,1,4), ''<$BRID>'')
      OR AF.CAREBY IN (SELECT TLGRP.GRPID FROM TLGRPUSERS TLGRP WHERE TLID = ''<$TELLERID>'')
    )', 'CFMAST_TX', '', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');