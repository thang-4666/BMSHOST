SET DEFINE OFF;
FROM odbuyin od, vsdtrfcode vsd, sbsecurities sb, allcode a0
WHERE od.trfcode = vsd.trfcode AND od.isincode = sb.isincode
AND od.excode = a0.cdval AND a0.cdname = ''VSDEXCODE'' AND a0.cdtype = ''OD''', 'ODMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');