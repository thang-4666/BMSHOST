SET DEFINE OFF;DELETE FROM PRCHK WHERE 1 = 1 AND NVL(TLTXCD,'NULL') = NVL('3351','NULL');Insert into PRCHK   (TLTXCD, CHKTYPE, TYPE, TYPEID, BRIDTYPE, PRTYPE, ACCFLDCD, TYPEFLDCD, DORC, AMTEXP, ODRNUM, UDPTYPE, DELTD, LNACCFLDCD, LNTYPEFLDCD) Values   ('3351', 'I', 'AFTYPE', '03', '0', 'R', '08', '', 'D', '11', 0, 'I', 'N', '', '');COMMIT;