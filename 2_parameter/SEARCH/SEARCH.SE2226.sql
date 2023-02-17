SET DEFINE OFF;
       re.trfdate effdate, de.depositid inward, flog.trfcode, a1.cdcontent msgstatus, sb.parvalue, tl.tlname, re.trftxnum,
       TX.TLTXCD, TX.TXDESC,substr(re.reseacctno,1,10) afacctno
FROM sereceived re, sbsecurities sb, cfmast cf, deposit_member de, allcode a1, vsdtxreq rq, tlprofiles tl, tltx TX,
     ( SELECT referenceid, MAX(autoid) autoid, MAX(funcname) trfcode
         FROM (SELECT * FROM vsdtrflog flog WHERE flog.msgtype = ''544'' AND INSTR (flog.funcname, ''.ACK'') = 0)
        GROUP BY referenceid) flog
WHERE re.symbol = sb.symbol
  AND re.recustodycd = cf.custodycd
  AND re.frbiccode = de.biccode
  AND re.reqid = rq.reqid
  AND rq.reqid = flog.referenceid
  AND rq.tlid = tl.tlid(+)
  AND a1.cdtype = ''SA''
  AND a1.cdname = ''VSDTXREQSTS''
  AND a1.cdval = rq.msgstatus
  AND re.status = ''A''
  AND CASE WHEN re.custodycd = re.recustodycd AND re.trade > 0 THEN ''2221''
           WHEN re.custodycd = re.recustodycd AND re.blocked > 0 THEN ''2220''
           WHEN instr(sb.isincode,''MIR'') > 0 THEN ''3385'' ELSE ''2245'' END = tx.tltxcd', 'SEMAST', 'frmSEMAST', 'REQID DESC', '2226', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');