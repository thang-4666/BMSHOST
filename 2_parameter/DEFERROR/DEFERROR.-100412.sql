SET DEFINE OFF;DELETE FROM DEFERROR WHERE 1 = 1 AND ERRNUM = -100412;Insert into DEFERROR   (ERRNUM, ERRDESC, EN_ERRDESC, MODCODE, CONFLVL) Values   (-100412, '[-100412]: Không thể thay đổi ngân hàng , hợp đồng vẫn còn số dư!', '[-100412]: Cannot change bank name', 'CF', 0);COMMIT;