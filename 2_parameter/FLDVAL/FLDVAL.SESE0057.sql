SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('SE.SE0057','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('PV_COUNT', 'SE.SE0057', 1, 'V', '>>', '@0', '', 'Số ngày phải lớn hơn 0!', 'The fee rate can not less than 0!', '', '', 0);COMMIT;