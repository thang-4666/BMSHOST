SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400101;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400101, '[-400101]: Số dư tiền không đủ!', '[-400101]:Balance is not enought!', 'CI', NULL);COMMIT;