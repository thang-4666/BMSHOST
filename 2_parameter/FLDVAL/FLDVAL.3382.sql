SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('3382','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('03', '3382', 0, 'E', '&&', '02&&01', '', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('08', '3382', 0, 'E', '&&', '04&&07', '', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('23', '3382', 0, 'E', 'EX', '22--21', '', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('05', '3382', 1, 'E', '&&', '04&&01', '', '', '', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('36', '3382', 1, 'I', 'FX', 'FNC_CHECK_TLTXCD_SCOPE', '36##BR##TL##TX', 'NSD không có quyền thực hiện cho khách hàng', 'NSD kh�c�y?n th?c hi?n cho kh� h�', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('21', '3382', 2, 'V', '>>', '@0', '', 'So luong phai lon hon 0', 'Quantity should be greater than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('04', '3382', 3, 'V', '<>', '02', '', 'Không thể chuyển nhượng cùng tiểu khoản', 'Không thể chuyển nhượng cùng tiểu khoản', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('31', '3382', 3, 'V', 'IN', '@Y', '', 'Sự kiện thực hiện quyền mua này không cho phép chuyển nhượng !', 'Can not tranfer !', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('26', '3382', 7, 'E', 'FX', 'FN_3382_GET_QTTY', '06##21', '', '', '', '', 0);COMMIT;