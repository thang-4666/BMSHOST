SET DEFINE OFF;
FROM V_CAMAST ca, ALLCODE a 
WHERE ca.typeid = a.cdval AND a.cdname=''CATYPEVSD'' AND a.cdtype =''CA''', 'CAMAST', 'frmCAMAST', 'AUTOID DESC', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');