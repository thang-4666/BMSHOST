SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -502;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-502, 'Không nhận giao dịch backdate của ngày hiện tại', 'Không nhận giao dịch backdate của ngày hiện tại', 'PM', NULL);COMMIT;