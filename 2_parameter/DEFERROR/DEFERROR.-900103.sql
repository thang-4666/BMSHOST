SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -900103;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-900103, '[-900103]:Không được backdate về trước ngày nhận yêu cầu rút chứng khoán!', '[-900103]: Không được backdate về trước ngày nhận yêu cầu rút chứng khoán', 'SE', NULL);COMMIT;