SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('6691','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('10', '6691', 0, 'V', '>>', '@0', '', 'Số tiền giải tỏa phải lớn hơn 0!', 'Số tiền giải tỏa phải lớn hơn 0!', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('11', '6691', 0, 'E', 'RM', '03', 'AVLBAL', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('14', '6691', 0, 'E', 'RM', '03', 'BALANCE', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('13', '6691', 1, 'E', 'FX', 'getbankbaldefovd', '03', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('88', '6691', 1, 'I', 'FX', 'FNC_CHECK_TLTXCD_SCOPE', '88##BR##TL##TX', 'NSD không có quyền thực hiện cho khách hàng', 'NSD không có quyền thực hiện cho khách hàng', '', '', 0);COMMIT;