SET DEFINE OFF;DELETE FROM SYSVAR WHERE 1 = 1 AND NVL(VARNAME,'NULL') = NVL('EKYC_CUSTODYCD','NULL');Insert into SYSVAR   (GRNAME, VARNAME, VARVALUE, VARDESC, EN_VARDESC, EDITALLOW, STATUS, PSTATUS) Values   ('SYSTEM', 'EKYC_CUSTODYCD', '69', 'Giới hạn phạm vi gen số lưu ký tài khoản eKYC', 'Limiting the range of eKYC account custodial numbers', 'Y', 'A', 'AP');COMMIT;