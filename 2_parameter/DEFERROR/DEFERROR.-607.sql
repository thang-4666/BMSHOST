SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -607;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-607, 'Phương án không tồn tại hoặc bị deactive', 'Phương án không tồn tại hoặc bị deactive', 'PM', NULL);COMMIT;