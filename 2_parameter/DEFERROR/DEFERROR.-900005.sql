SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -900005;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-900005, '[-900005]: Số lưu ký không trùng với điện nhận về', '[-900005]: Số lưu kí không trùng với điện nhận về', 'SE', NULL);COMMIT;