SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('CF.CFTRDPOLICY','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('SMAXQTTYODR', 'CF.CFTRDPOLICY', 2, 'V', '>=', '@0', '', 'KL tối đa/lệnh phải >= 0', 'KL tối đa/lệnh >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('SMAXNAV', 'CF.CFTRDPOLICY', 3, 'V', '>=', '@0', '', 'GT danh mục tối đa phải >= 0', 'GT danh mục tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('GMAXNAV', 'CF.CFTRDPOLICY', 5, 'V', '>=', '@0', '', 'GT danh mục tối đa phải >= 0', 'GT danh mục tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('UMAXNAV', 'CF.CFTRDPOLICY', 7, 'V', '>=', '@0', '', 'GT danh mục tối đa phải >= 0', 'GT danh mục tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IMAXAVLBAL', 'CF.CFTRDPOLICY', 9, 'V', '>=', '@0', '', 'SL nắm giữ tối phải đa >= 0', 'SL nắm giữ tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IMINAVLBAL', 'CF.CFTRDPOLICY', 10, 'V', '>=', '@0', '', 'SL nắm giữ tối thiểu phải >= 0', 'SL nắm giữ tối thiểu >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IMAXBPRICE', 'CF.CFTRDPOLICY', 11, 'V', '>=', '@0', '', 'Giá mua tối đa phải >= 0', 'Giá mua tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IMINSPRICE', 'CF.CFTRDPOLICY', 12, 'V', '>=', '@0', '', 'Giá bán tối thiểu phải >= 0', 'Giá bán tối thiểu >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IDELTABPRC', 'CF.CFTRDPOLICY', 13, 'V', '>=', '@0', '', 'Biên độ giá mua phải >= 0', 'Biên độ giá mua >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IDELTASPRC', 'CF.CFTRDPOLICY', 14, 'V', '>=', '@0', '', 'Biên độ giá bán phải >= 0', 'Biên độ giá bán >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IMAXALLBUY', 'CF.CFTRDPOLICY', 15, 'V', '>=', '@0', '', 'GT mua tối đa phải >= 0', 'GT mua tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('IMAXALLSELL', 'CF.CFTRDPOLICY', 16, 'V', '>=', '@0', '', 'GT bán tối phải đa >= 0', 'GT bán tối đa >= 0 ', '', '', 0);Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('TODATE', 'CF.CFTRDPOLICY', 22, 'V', '>=', 'FRDATE', '', 'Từ ngày phải nhỏ hoặc bằng đến ngày', 'from date must be equal or greater than to date!', '', '', 0);COMMIT;