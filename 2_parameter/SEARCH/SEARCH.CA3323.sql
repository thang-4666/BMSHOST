SET DEFINE OFF;
        schd.trade orgqtty, schd.pqtty + schd.qtty maxqtty, mst.exprice, mst.reportdate,
        mst.exrate, mst.rightoffrate
FROM    cfmast cf, afmast af, camast mst, caschd schd, sbsecurities sec, sbsecurities sec2
WHERE   cf.custid = af.custid AND af.acctno = schd.afacctno AND schd.camastid = mst.camastid
        AND mst.codeid = sec.codeid AND nvl(mst.tocodeid, mst.codeid) = sec2.codeid
        AND mst.catype = ''014'' AND schd.status IN (''A'',''V'') AND af.status = ''N''', 'CAMAST', '', '', '3323', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');