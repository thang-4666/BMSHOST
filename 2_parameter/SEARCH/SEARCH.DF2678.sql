SET DEFINE OFF;
SELECT v.*, (v.orgamt - v.amt) DRAWNDOWNAMT,
''Giải ngân /'' || dft.typename || ''/'' || dft.actype || ''/'' || v.acctno || ''/'' || v.symbol DESCSEARCH
FROM v_getdealinfo v, dftype dft
WHERE v.actype = dft.actype and amt=0 and v.status =''P''
', 'DFMAST', '', 'ACCTNO DESC', '2678', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');