SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -540218;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-540218, '[-540218]: Ngày gia hạn không vượt quá số ngày vay tối đa!', '[-540218]: Ngày gia hạn không vượt quá số ngày vay tối đa!', 'LN', NULL);COMMIT;