SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -700048;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-700048, '[-700048]: ERR_OD_TRADERID_NOT_INVALID', '[-700048]: ERR_OD_TRADERID_NOT_INVALID', 'OD', NULL);COMMIT;