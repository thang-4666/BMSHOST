SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100721;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100721, '[-100721]: Phải xóa từ số tiền cao đến thấp', '[-100720]: ERR_SA_CAN_NOT_DELELE!', 'SA', NULL);COMMIT;