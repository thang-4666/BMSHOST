SET DEFINE OFF;
       af.typename aftypename, a.cdcontent PRODUCTTYPE
From cfaftype c, allcode A, aftype af
where AF.producttype=a.cdval and cdTYPE = ''CF'' AND
CDNAME=''PRODUCTTYPE'' and af.actype=c.aftype
AND C.CFTYPE=''<$KEYVAL>''', 'CF.CFAFTYPE', 'frmTDTYPE', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');