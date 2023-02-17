SET DEFINE OFF;
    CRB.accnum, CRB.branch, CRB.location, CRB.amount, CRB.keyacct1, CRB.keyacct2,  CRB.transactiondescription,
    CRB.isconfirmed, CRB.ismanual, CRB.usercreated, CRB.createdt, CRB.errordesc, bk.shortname bankcode,CRB.KEYACCT1 CUSTODYCD
FROM crbbankrequest CRB, ALLCODE A1, banknostro bk
where CRB.STATUS =A1.CDVAL AND A1.CDTYPE = ''RM'' AND A1.CDNAME = ''CRBRQDSTS''
    AND CRB.STATUS = ''B'' AND CRB.desbankaccount = bk.bankacctno(+) AND CRB.txdate = getcurrdate
    AND CRB.trnref NOT IN (SELECT Distinct fld.cvalue from tllog tl, tllogfld fld where tl.txnum = fld.txnum and tl.txdate = fld.txdate
    And fld.fldcd = ''31'' and tl.tltxcd = ''1196'' and fld.cvalue IS NOT NULL And tl.DELTD <> ''Y'' AND tl.TXSTATUS NOT IN (''5'',''7'', ''8'',''9''))', 'RM2003', '', '', '1196', 50, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');