SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('2624','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('41', '2624', 0, 'V', '>=', '@0', '', 'Số tiền nhập vào phải lớn hơn hoặc bằng 0', 'Amount must be greater than zero', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('88', '2624', 1, 'I', 'FX', 'FNC_CHECK_TLTXCD_SCOPE', '88##BR##TL##TX', 'NSD không có quyền thực hiện cho khách hàng', 'NSD kh�c�y?n th?c hi?n cho kh� h�', '', '', 0);COMMIT;