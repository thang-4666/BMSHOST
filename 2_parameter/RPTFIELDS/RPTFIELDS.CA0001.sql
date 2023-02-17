SET DEFINE OFF;DELETE FROM RPTFIELDS WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('CA0001','NULL');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CA', 'F_DATE', 'CA0001', 'F_DATE', 'Từ ngày', 'From date', 1, 'M', '99/99/9999', 'dd/MM/yyyy', 10, '', '', '<$BUSDATE>', 'Y', 'N', 'Y', '', '', 'N', 'D', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CA', 'T_DATE', 'CA0001', 'T_DATE', 'Đến ngày', 'To date', 2, 'M', '99/99/9999', 'dd/MM/yyyy', 10, '', '', '<$BUSDATE>', 'Y', 'N', 'Y', '', '', 'N', 'D', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CA', 'PV_CUSTODYCD', 'CA0001', 'PV_CUSTODYCD', 'Số TK lưu ký', 'Custody code', 3, 'M', 'cccc.cccccc', '_', 10, '', '', '', 'Y', 'N', 'N', '', '', 'N', 'C', '', '', '', '', '', '', 'CUSTODYCD_TX', 'CF', '', '', '', '', 'Y', 'T', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CA', 'PV_AFACCTNO', 'CA0001', 'PV_AFACCTNO', 'Số tiểu khoản', 'Sub account', 4, 'T', 'cccc.cccccc', '_', 10, '', '', 'ALL', 'Y', 'N', 'N', '', '', 'N', 'C', '', '', '', '', '', '', 'AFMAST', 'CF', '', '', '', '', 'Y', 'T', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CA', 'ISCOMP', 'CA0001', 'ISCOM', 'Đã phân bổ', 'ISCUSTACOM', 5, 'M', 'ccc', '_', 3, 'SELECT CDVAL VALUE,CDVAL VALUECD, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION FROM
(select CDVAL,CDCONTENT,LSTODR from ALLCODE  WHERE CDNAME =''YESNO'' AND CDTYPE=''SY''   UNION SELECT ''ALL'' CDVAL, ''Tất cả'' CDCONTENT, -1 LSTODR FROM DUAL ) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');COMMIT;