SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400108;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400108, '[-400108]: Vượt quá số tiền phong tỏa của tiểu khoản!', '[-400108]:Vượt quá số tiền phong tỏa của tiểu khoản!', 'CI', NULL);COMMIT;