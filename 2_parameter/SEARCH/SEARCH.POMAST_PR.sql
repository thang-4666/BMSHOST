SET DEFINE OFF;
FROM
(select potxnum, potxdate from CIREMITTANCE  where deltd=''N'' and  potxnum is not null group by potxnum,potxdate) CI,
(
    SELECT PO.TXDATE, PO.TXNUM, PO.AMT, PO.BRID, PO.DELTD, CD.CDCONTENT STATUS, PO.BANKID, PO.BANKNAME, PO.BANKACC,
        PO.BANKACCNAME, PO.GLACCTNO, PO.FEETYPE, PO.POTYPE, PO.BENEFACCT, PO.BENEFNAME, PO.BENEFCUSTNAME,
        PO.DESCRIPTION, tl.tltxcd
    FROM POMAST PO, ALLCODE CD, vw_tllog_all tl, vw_tllogfld_all tf
    WHERE CD.CDNAME =''POSTATUS'' AND CD.CDTYPE =''SA''
    And tl.txnum = tf.txnum AND tl.txdate = tf.txdate
    AND tf.fldcd = ''99'' AND tf.cvalue = po.txnum
    AND CD.CDVAL= PO.STATUS AND PO.DELTD=''N''  and po.codeid is null
) A left join
(
    select DISTINCT po.potxnum, po.potxdate, po.camastid, sb.symbol, CA.ISINCODE
    from
    (
        select potxnum, potxdate, camastid from podetails
        union all
        select potxnum, potxdate, camastid from podetailshist
    ) po,
    (select * from camast union all select * from camasthist) ca, sbsecurities sb
    where po.camastid = ca.camastid
        and ca.codeid = sb.codeid
) po
on A.txnum = po.potxnum and a.txdate = po.potxdate
WHERE A.TXDATE = CI.POTXDATE AND A.TXNUM = CI.POTXNUM
union
SELECT PO.TXDATE, PO.TXNUM, PO.AMT, PO.BRID, PO.DELTD, CD.CDCONTENT STATUS, PO.BANKID, PO.BANKNAME, PO.BANKACC,
    PO.BANKACCNAME, PO.GLACCTNO, PO.FEETYPE, PO.POTYPE, PO.BENEFACCT, PO.BENEFNAME, PO.BENEFCUSTNAME,
    PO.DESCRIPTION, tl.tltxcd, pod.camastid, pod.symbol, POD.ISINCODE
FROM  ALLCODE CD, vw_tllog_all tl, vw_tllogfld_all tf, POMAST PO
left join
(
    select DISTINCT po.potxnum, po.potxdate, po.camastid, sb.symbol, CA.ISINCODE
    from
    (
        select potxnum, potxdate, camastid
        from podetails
        union all
        select potxnum, potxdate, camastid from podetailshist
    )po,
    (select * from camast union all select * from camasthist) ca, sbsecurities sb
    where po.camastid = ca.camastid
        and ca.codeid = sb.codeid
) pod
on po.txnum = pod.potxnum and po.txdate = pod.potxdate
WHERE CD.CDNAME = ''POSTATUS'' AND CD.CDTYPE =''SA''
    AND CD.CDVAL= PO.STATUS AND PO.DELTD=''N'' and po.codeid is not null
    AND tl.txnum = tf.txnum AND tl.txdate = tf.txdate
    AND tf.fldcd = ''99'' AND tf.cvalue = po.txnum', 'POMAST_PR', '', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');