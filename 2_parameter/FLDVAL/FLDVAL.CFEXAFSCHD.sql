SET DEFINE OFF;DELETE FROM FLDVAL WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('CF.EXAFSCHD','NULL');Insert into FLDVAL   (FLDNAME, OBJNAME, ODRNUM, VALTYPE, OPERATOR, VALEXP, VALEXP2, ERRMSG, EN_ERRMSG, TAGFIELD, TAGVALUE, CHKLEV) Values   ('DELTA', 'CF.EXAFSCHD', 0, 'V', '>=', '@0', '', 'Delta phai lon hon hoac bang 0!', 'Delta should be greater than or equal to zero!', '', '', 0);COMMIT;