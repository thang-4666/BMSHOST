SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400209;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400209, '[-400209]: Nguồn ứng trước đã bị đổi !', '[-400209]: Nguồn ứng trước đã bị đổi', 'CI', NULL);COMMIT;