SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -400022;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-400022, '[-400022]: Yêu cầu chuyển khoản đã hoàn tất hoặc đã bị từ chối!', '[-400022]:  Yêu cầu chuyển khoản đã hoàn tất hoặc đã bị từ chối', 'CI', NULL);COMMIT;