SET DEFINE OFF;
 TRUNC(CI.CIDEPOFEEACR) AVL,
 (SELECT SUBSTR(VARVALUE,4) FROM SYSVAR WHERE VARNAME =''CURRDATE'') FDATE,
TO_DATE ((select  VARVALUE FROM SYSVAR WHERE VARNAME =''CURRDATE''),''DD/MM/YYYY'')TDATE
FROM AFMAST AF, CFMAST CF, AFTYPE TYP,CIMAST CI,
( SELECT max( decode (fldcd,''03'',cvalue)) afacctno, max( decode (fldcd,''10'',nvalue))CIDEPOFEEACR
FROM tllog4dr tl,tllogfld4dr tlfld
WHERE tl.txnum = tlfld.txnum AND tl.txdate = tlfld.txdate
AND tltxcd =''1189''   and tl.deltd <> ''Y'' and tl.txstatus =''4''
and not  EXISTS (select 1 from tllog t where t.txnum = tl.txnum and t.deltd<>''Y'' and txstatus =''1'')
) DTL
WHERE ci.acctno=dtl.afacctno(+) and CI.ACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID AND AF.ACTYPE=TYP.ACTYPE AND TRUNC(CI.CIDEPOFEEACR)- nvl(dtl.CIDEPOFEEACR,0) >0


', 'BANKINFO', 'CI1189', 'CUSTODYCD, AFACCTNO, TDATE', '1189', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');