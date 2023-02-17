SET DEFINE OFF;
A1.CDCONTENT TDSRCDIS, A2.CDCONTENT SCHDTYPEDIS, TYP.TDTERM, A4.CDCONTENT TERMCDDIS, A3.CDCONTENT BREAKCD ,
TYP.CIACCTNO,TYP.INTRATE,(CASE WHEN TYP.TDSRC=''O'' THEN 1 ELSE 0 END) ISCI,
TYP.MINBRTERM,TYP.SCHDTYPE, TYP.SPREADTERM, TYP.SPREADRATE,TYP.TDSRC,TYP.TERMCD
FROM TDTYPE TYP, SBCURRENCY SBC, ALLCODE A0, ALLCODE A1, ALLCODE A2, ALLCODE A3, ALLCODE A4,sysvar var
WHERE A0.CDTYPE = ''SY'' AND A0.CDNAME = ''YESNO'' AND A0.CDVAL=TYP.STATUS
AND SBC.CCYCD=TYP.CCYCD AND A1.CDTYPE = ''TD'' AND A1.CDNAME = ''TDSRC'' AND A1.CDVAL=TYP.TDSRC AND A2.CDTYPE = ''TD'' AND A2.CDNAME = ''SCHDTYPE'' AND A2.CDVAL=TYP.SCHDTYPE
AND A3.CDTYPE = ''SY'' AND A3.CDNAME = ''YESNO'' AND A3.CDVAL=TYP.BREAKCD AND A4.CDTYPE = ''TD'' AND A4.CDNAME = ''TERMCD'' AND A4.CDVAL=TYP.TERMCD
and var.varname=''CURRDATE'' and
typ.effdate <= to_date(var.varvalue,''DD/MM/RRRR'') and typ.expdate >= to_date(var.varvalue,''DD/MM/RRRR'')', 'TDTYPE', 'frmTDTYPE', 'ACTYPE', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');