SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_DFGRPAMT
(GROUPID, AMTDF, AMTLN, LRATE, AMTEXT, 
 AMTWIT)
BEQUEATH DEFINER
AS 
SELECT DFG.GROUPID, df.amtdf+dfg.dfamt amtdf,LN.amtln ,DFG.LRATE,greatest( LN.amtln*DFG.IRATE/100-df.amtdf-dfg.dfamt ,0) AMTEXT
,LEAST( greatest( df.amtdf+dfg.dfamt-LN.amtln*DFG.IRATE/100,0),dfg.dfamt ) AMTWIT
FROM ( SELECT
ln.PRINNML+ln.PRINOVD+ln.INTNMLACR+ln.INTOVDACR+ln.INTNMLOVD+ln.INTDUE+
ln.OPRINNML+ln.OPRINOVD+ln.OINTNMLACR+ln.OINTOVDACR+ln.OINTNMLOVD+
ln.OINTDUE+ln.FEE+ln.FEEDUE+ln.FEEOVD AMTLN ,acctno from  LNMAST ln ) LN, dfgroup DFG,
(
SELECT SUM ( (nvl(df.dfqtty,0) + nvl(df.rcvqtty,0) + nvl(df.carcvqtty,0) + nvl(df.blockqtty,0) + nvl(df.bqtty,0)) * SB.BASICPRICE * DF.DFRATE /100 ) AMTDF, DF.GROUPID,LNACCTNO
FROM DFMAST DF, SECURITIES_INFO SB
WHERE DF.CODEID = SB.CODEID
AND DF.GROUPID IS NOT NULL
GROUP BY GROUPID,LNACCTNO) df
WHERE LN.ACCTNO = DFG.LNACCTNO
AND DFG.GROUPID = DF.GROUPID
/
