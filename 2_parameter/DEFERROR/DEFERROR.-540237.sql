SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -540237;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-540237, '[-540237]:vượt quá số lần được phép gia hạn của món vay, không được phép gia hạn!', '[-540237]:vượt quá số lần được phép gia hạn của món vay, không được phép gia hạn!', 'LN', NULL);COMMIT;