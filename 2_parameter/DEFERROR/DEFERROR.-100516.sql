SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100516;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100516, 'ERR_PRTYPE_NOT_FOUND: Không tìm thấy loại hình Pool/Room', 'ERR_PRTYPE_NOT_FOUND', 'SA', NULL);COMMIT;