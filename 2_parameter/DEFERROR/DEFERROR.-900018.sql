SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -900018;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-900018, '[-900018]: Tài khoản vẫn còn tiền!', '[-900018]:Tài khoản vẫn còn tiền!', 'SE', NULL);COMMIT;