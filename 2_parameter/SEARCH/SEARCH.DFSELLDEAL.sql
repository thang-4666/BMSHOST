SET DEFINE OFF;
select v.*,cd.cdcontent DEALTYPE,
v.PRINNML+v.INTNMLACR+v.INTDUE+
v.OPRINNML+v.OINTNMLACR+
v.OINTDUE+v.FEE+v.FEEDUE -nvl(sts.NML,0) INDUEAMT,
nvl(sts.NML,0) DUEAMT,
v.PRINOVD+v.INTOVDACR+v.INTNMLOVD
+v.OPRINOVD+v.OINTOVDACR+v.OINTNMLOVD+v.FEEOVD OVERDUEAMT,
v.INTNMLACR+ v.OINTNMLACR + OINTOVDACR + INTOVDACR INTACR,
greatest(v.INTAMTACR+v.feeamt,v.FEEMIN-v.RLSFEEAMT) DEALFEEAMT
from v_getDealInfo v, allcode cd,
 (SELECT S.ACCTNO, SUM(NML) NML, M.TRFACCTNO FROM LNSCHD S, LNMAST M
        WHERE S.OVERDUEDATE = TO_DATE((select varvalue from sysvar where grname =''SYSTEM'' and varname =''CURRDATE''),''DD/MM/YYYY'') AND S.NML > 0 AND S.REFTYPE IN (''P'')
            AND S.ACCTNO = M.ACCTNO AND M.STATUS NOT IN (''P'',''R'',''C'')
        GROUP BY S.ACCTNO, M.TRFACCTNO
        ORDER BY S.ACCTNO) sts
where v.lnacctno = sts.acctno (+)
 and v.afacctno like nvl(''<$AFACCTNO>'',''%'') and v.dftrading>0
and cd.cdname=''DFTYPE'' and cd.cdtype=''DF'' and cd.cdval=v.dftype
', 'DFMAST', 'frmCreateDFDEAL', '', '', NULL, 50, 'N', 0, '', 'Y', 'T', '', 'N', '', '');