SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('0018','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('88', '0018', 1, 'I', 'FX', 'FNC_CHECK_TLTXCD_SCOPE', '88##BR##TL##TX', 'NSD không có quyền thực hiện cho khách hàng', 'NSD không có quy?n th?c hi?n cho khách hàng', '', '', 0);COMMIT;