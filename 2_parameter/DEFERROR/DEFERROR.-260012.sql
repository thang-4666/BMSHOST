SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -260012;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-260012, '[-260012]: Số dư khả dụng không đủ !', '[-260012]: Số dư khả dụng không đủ !', 'DF', NULL);COMMIT;