SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('2263','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('04', '2263', 1, 'I', 'FX', 'FNC_CHECK_TLTXCD_SCOPE', '04##BR##TL##TX', 'NSD không có quyền thực hiện cho khách hàng', 'NSD kh�c�y?n th?c hi?n cho kh� h�', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('10', '2263', 1, 'V', '>=', '@0', '', 'Số lượng chứng khoán giao dịch phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('12', '2263', 2, 'V', '>=', '@0', '', 'Số lượng chứng khoán cầm cố phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('15', '2263', 3, 'V', '>=', '@0', '', 'Số lượng cầm cố lên trung tâm phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('16', '2263', 4, 'V', '>=', '@0', '', 'Số lượng chờ rút phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('17', '2263', 5, 'V', '>=', '@0', '', 'Số lượng lưu ký phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('19', '2263', 6, 'V', '>=', '@0', '', 'Số lượng phong tỏa loại 8 phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('39', '2263', 6, 'V', '>=', '@0', '', 'Số lượng phong tỏa phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('22', '2263', 7, 'V', '>=', '@0', '', 'Số lượng lưu ký gửi trung tâm phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('25', '2263', 7, 'V', '>=', '@0', '', 'Số lượng lưu ký gửi trung tâm phải lớn hơn 0', 'Quantity should be greater  than zero', '', '', 0);COMMIT;