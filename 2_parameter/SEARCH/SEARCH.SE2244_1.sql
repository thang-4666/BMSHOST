SET DEFINE OFF;
FROM v_SE2244 v, SESEND_REQ s
where v.custodycd = s.custodycd and v.symbol = s.symbol and v.trade >= s.trade and v.blocked >= s.blocked and s.status =''P''', 'SEMAST', 'frmSEMAST', '', '2244', 0, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');