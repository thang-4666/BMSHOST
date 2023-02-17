SET DEFINE OFF;DELETE FROM RPTFIELDS WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('CF0020','NULL');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'F_DATE', 'CF0020', 'F_DATE', 'Từ ngày', 'From date', 0, 'M', '99/99/9999', 'dd/MM/yyyy', 10, '', '', '<$BUSDATE>', 'Y', 'N', 'Y', '', '', 'N', 'D', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'T_DATE', 'CF0020', 'T_DATE', 'Đến ngày', 'To date', 1, 'M', '99/99/9999', 'dd/MM/yyyy', 10, '', '', '<$BUSDATE>', 'Y', 'N', 'Y', '', '', 'N', 'D', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'I_BRIDGD', 'CF0020', 'I_BRIDGD', 'Chi nhánh', 'Branch', 2, 'M', 'cccccccccc', '_', 10, 'SELECT brid VALUE, brid display, brname en_display, brname description FROM (SELECT brid, brname, 1 lstodr FROM brgrp UNION SELECT ''ALL'' brid, ''ALL'' brname, -1 lstodr FROM DUAL) ORDER BY lstodr', '', 'ALL', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'PV_STATUSVSD', 'CF0020', 'PV_STATUSVSD', 'Trạng thái kích hoạt VSD', 'VSD status', 10, 'M', 'cccccccc', '_', 10, 'SELECT CDVAL VALUE, CDVAL VALUECD, cdcontent DISPLAY, cdcontent EN_DISPLAY, cdcontent DESCRIPTION FROM
(SELECT ''ALL'' CDVAL ,''ALL'' cdcontent ,-1 LSTODR FROM DUAL
UNION ALL
SELECT CDVAL , cdcontent , LSTODR FROM ALLCODE WHERE CDTYPE=''CF'' AND CDNAME=''ACTIVESTS''
)ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'BRANCH', 'CF0020', 'BRANCH', 'Nơi gửi', 'Branch', 11, 'T', '', '_', 70, 'SELECT ''Sở giao dịch chứng khoán Hà Nội'' VALUECD, ''Sở giao dịch chứng khoán Hà Nội'' VALUE, ''Sở giao dịch chứng khoán Hà Nội'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Sở giao dịch chứng khoán Hồ Chí Minh'' VALUECD, ''Sở giao dịch chứng khoán Hồ Chí Minh'' VALUE, ''Sở giao dịch chứng khoán Hồ Chí Minh'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'PV_CLASS', 'CF0020', 'PV_CLASS', 'TK chuyên dụng', 'PV_CLASS', 20, 'M', 'cccccccccc', '_', 10, 'SELECT CDVAL VALUE, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM      (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 0 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''ALL'' CDVAL, ''ALL'' CDCONTENT, 2 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'PV_CUSTATCOM', 'CF0020', 'PV_CUSTATCOM', 'Tài khoản không lưu ký', 'PV_CUSTATCOM', 21, 'M', 'cccccccccc', '_', 10, 'SELECT CDVAL VALUE, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (SELECT ''N'' CDVAL, ''Không'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''Y'' CDVAL, ''Có'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('CF', 'PV_OPENVIA', 'CF0020', 'PV_OPENVIA', 'Kênh mở tài khoản', 'PV_OPENVIA', 23, 'M', 'cccccccccc', '_', 20, 'SELECT CDVAL VALUE, CDCONTENT DISPLAY, CDCONTENT EN_DISPLAY, CDCONTENT DESCRIPTION
FROM (SELECT ''F'' CDVAL, ''Mở tại quầy'' CDCONTENT, 1 LSTODR FROM DUAL
UNION ALL SELECT ''I'' CDVAL, ''Mở theo danh sách Import'' CDCONTENT, 2 LSTODR FROM DUAL
UNION ALL SELECT ''O'' CDVAL, ''Mở trên online'' CDCONTENT, 3 LSTODR FROM DUAL
UNION ALL SELECT ''C'' CDVAL, ''Online bán chéo'' CDCONTENT, 4 LSTODR FROM DUAL
UNION ALL SELECT ''A'' CDVAL, ''Tất cả'' CDCONTENT, 0 LSTODR FROM DUAL) ORDER BY LSTODR', '', 'A', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');COMMIT;