SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100401;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100401, '[-100401]: Rổ chứng khoán đã được dùng!', '[-100401]: Rổ chứng khoán đã được dùng!', 'SA', NULL);COMMIT;