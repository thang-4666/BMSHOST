SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('1631','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('09', '1631', 0, 'V', '==', '@Y', '', 'Tham số ''Tự động rút để mua'' phải chuyển sang có', 'The buyingpower variable must be changed to yes', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('04', '1631', 1, 'I', 'FX', 'FNC_CHECK_TLTXCD_SCOPE', '04##BR##TL##TX', 'NSD không có quyền thực hiện cho khách hàng', 'NSD kh�c�y?n th?c hi?n cho kh� h�', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('04', '1631', 5, 'I', 'FX', 'fn_checkcustody16', '04', 'Không thực hiện giao dịch với tài khoản tự doanh', 'Khong thuc hien giao dich voi tai khoan tu doanh', '', '', 0);COMMIT;