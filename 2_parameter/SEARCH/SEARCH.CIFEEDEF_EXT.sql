SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('CIFEEDEF_EXT','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('CIFEEDEF_EXT', 'Biểu phí lưu ký riêng cho khách hàng', 'Exception fee deposit for customer', 'SELECT DEF.ACTYPE,DEF.TYPENAME,DEF.FEEAMT,DEF.LOTDAY,DEF.LOTVAL,
A1.CDCONTENT TRADEPLACE,
A2.CDCONTENT SECTYPE,A3.CDCONTENT STATUS,SB.SYMBOL,
(CASE WHEN DEF.STATUS IN (''P'') THEN ''Y'' ELSE (CASE WHEN NVL(cifeaf.counts,0) = 1 THEN ''Y'' ELSE ''N'' END) END) APRALLOW
FROM CIFEEDEF_EXT DEF,
ALLCODE A1,ALLCODE A2,ALLCODE A3,SBSECURITIES SB,
(select actype , max(1) counts  from CIFEEDEF_EXTLNK where status <> ''A'' group by actype) cifeaf
WHERE A1.CDNAME=''TRADEPLACE'' AND A1.CDTYPE=''SA'' AND A1.CDVAL=DEF.TRADEPLACE
AND A2.CDNAME=''SECTYPE'' AND A2.CDTYPE=''SA'' AND A2.CDVAL=DEF.SECTYPE
AND A3.CDNAME=''STATUS''  AND A3.CDTYPE=''SA'' AND A3.CDVAL=DEF.STATUS
AND SB.CODEID(+)=DEF.CODEID and def.actype = cifeaf.actype(+) ', 'CIFEEDEF_EXT', 'frmCIFEEDEF_EXT', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;