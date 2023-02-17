SET DEFINE OFF;
     (CASE WHEN SUBSTR(CUSTODYCD,4,1) = ''F'' THEN CF.tradingcode ELSE CF.idcode END) idcode,
    (CASE WHEN SUBSTR(CUSTODYCD,4,1) = ''F'' THEN CF.tradingcodedt ELSE CF.IDDATE END) IDDATE,
    CF.idplace, CF.CUSTODYCD,
    (CASE WHEN CF.IDTYPE = ''001'' THEN ''1''
        WHEN CF.IDTYPE = ''002'' THEN ''2''
        WHEN CF.IDTYPE = ''005'' THEN ''3''
        ELSE ''4'' END) IDTYPE,
    (CASE WHEN CF.CUSTTYPE = ''I'' THEN
            (CASE WHEN SUBSTR(CUSTODYCD,4,1) = ''C'' THEN ''3''
                  WHEN SUBSTR(CUSTODYCD,4,1) = ''F'' THEN ''4'' ELSE ''7'' END)
            ELSE (CASE WHEN SUBSTR(CUSTODYCD,4,1) IN (''C'',''P'') THEN ''5''
                    WHEN SUBSTR(CUSTODYCD,4,1) = ''F'' THEN ''6'' ELSE ''7'' END) END) CUSTTYPE,
    CF.country, CF.address, CF.mobile, CF.email,CF.opndate,
    (CASE WHEN CF.CLASS=''000'' THEN ''Có'' ELSE ''Không'' END) PV_CLASS
FROM cfmast CF
WHERE CF.activests = ''N'' AND CF.ISBANKING <> ''Y''
AND(CF.STATUS=''A'' OR (CF.STATUS <>''C'' AND INSTR(CF.pstatus,''A'') <> 0))
AND CF.CUSTODYCD IS NOT NULL
AND CF.custatcom = ''Y''', 'CFMAST', 'frmSATLID', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');