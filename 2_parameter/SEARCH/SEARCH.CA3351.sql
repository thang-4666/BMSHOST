SET DEFINE OFF;
    AUTOID, CAMASTID, AFACCTNO, SYMBOL, CATYPE, STATUS, BALANCE, QTTY,
    (case when catypevalue in (''023'',''020'') then 0 else AQTTY end)  AQTTY, DUTYAMT,
    SEACCTNO, EXSEACCTNO, IDCODE, CUSTODYCD, ISCDCROUTAMT, FULLNAME, PRICEACCOUNTING,
    CATYPEVALUE, COSTPRICE, CODEID
FROM V_CA3351 WHERE (case when catypevalue in (''023'',''020'') then ISSE else ''N'' end) <> ''Y''', 'CAMAST', '', '', '3351', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');