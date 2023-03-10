SET DEFINE OFF;DELETE FROM RPTFIELDS WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('SA0007','NULL');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('SA', 'F_DATE', 'SA0007', 'F_DATE', 'Từ ngày', 'From date', 0, 'M', '99/99/9999', 'dd/MM/yyyy', 10, '', '', '<$BUSDATE>', 'Y', 'N', 'Y', '', '', 'N', 'D', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('SA', 'T_DATE', 'SA0007', 'T_DATE', 'Ðến ngày', 'To date', 1, 'M', '99/99/9999', 'dd/MM/yyyy', 10, '', '', '<$BUSDATE>', 'Y', 'N', 'Y', '', '', 'N', 'D', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('SA', 'OBJTYPE', 'SA0007', 'OBJTYPE', 'Loại đối tượng', 'Object type', 2, 'M', 'c', '_', 4, 'SELECT value, display, en_display, description FROM (
  SELECT ''B'' VALUE ,''Chi nhánh'' DISPLAY, ''Branch'' EN_DISPLAY, ''Chi nhánh'' description, 1 odrnum FROM dual
  UNION all
  SELECT ''G'' VALUE ,''Nhóm quyền'' DISPLAY, ''Group'' EN_DISPLAY, ''Nhóm quyền'' description, 2 odrnum FROM dual
  UNION ALL
  SELECT ''U'' VALUE ,''Người sử dụng'' DISPLAY, ''User'' EN_DISPLAY, ''Người sử dụng'' description, 3 odrnum FROM dual
  ) ORDER BY odrnum ', '', '', 'Y', 'N', 'Y', '', '', 'Y', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'T', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('SA', 'OBJID', 'SA0007', 'OBJID', 'ID đối tượng', 'Object ID', 3, 'M', 'ccccc', '_', 100, '', '', 'ALL', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', 'OBJID', '##########', '', '', '', '', 'OBJTYPE', 'SELECT ''ALL'' FILTERCD,''ALL''  VALUE,''ALL''  VALUECD, ''ALL'' DISPLAY,''ALL'' EN_DISPLAY, ''ALL'' DESCRIPTION FROM DUAL
UNION ALL
SELECT objid FILTERCD,objid VALUE,objid VALUECD,objname DISPLAY, objname EN_DISPLAY,objname DESCRIPTION  FROM
(SELECT  ''B'' || br.brid objid, br.brname||''-''||br.brid  objname, ''B'' IDTYPE
FROM brgrp br
UNION ALL
SELECT  ''G'' || tlg.grpid objid, tlg.grpname||''-''||tlg.grpid  objname, ''G'' IDTYPE
FROM tlgroups tlg WHERE TLG.GRPTYPE=''1'' AND TLG.ACTIVE=''Y''
UNION ALL
SELECT ''U'' || tl.tlid objid, tl.tlname||''-''||tl.tlid  objname, ''U'' IDTYPE
FROM tlprofiles tl ) WHERE  SUBSTR(objid,1,1)= UPPER(''<$TAGFIELD>'')

ORDER BY DISPLAY,VALUE', '', 'Y', 'C', 'N');Insert into RPTFIELDS   (MODCODE, FLDNAME, OBJNAME, DEFNAME, CAPTION, EN_CAPTION, ODRNUM, FLDTYPE, FLDMASK, FLDFORMAT, FLDLEN, LLIST, LCHK, DEFVAL, VISIBLE, DISABLE, MANDATORY, AMTEXP, VALIDTAG, LOOKUP, DATATYPE, INVNAME, FLDSOURCE, FLDDESC, CHAINNAME, PRINTINFO, LOOKUPNAME, SEARCHCODE, SRMODCODE, INVFORMAT, TAGFIELD, TAGLIST, TAGVALUE, ISPARAM, CTLTYPE, CHKSCOPE) Values   ('SA', 'PV_STATUS', 'SA0007', 'PLSENT', 'Trạng thái', 'Place sent', 20, 'M', '', '_', 20, '
SELECT ''ALL'' VALUECD, ''ALL'' VALUE, ''ALL'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Y'' VALUECD, ''Y'' VALUE, ''Hoạt động'' DISPLAY FROM DUAL
UNION ALL
SELECT ''Y'' VALUECD, ''N'' VALUE, ''Không hoạt động'' DISPLAY FROM DUAL', '', '', 'Y', 'N', 'Y', '', '', 'N', 'C', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'C', 'N');COMMIT;