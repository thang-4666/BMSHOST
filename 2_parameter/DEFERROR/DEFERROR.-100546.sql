SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100546;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100546, '[-100546]: Vượt quá hạn mức còn lại của Room hoặc số dư TK CK nhận không đủ !', '[-100546]: Vượt quá hạn mức còn lại của Room hoặc số dư TK CK nhận không đủ !', 'PR', NULL);COMMIT;