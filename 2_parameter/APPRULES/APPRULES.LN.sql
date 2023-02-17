SET DEFINE OFF;DELETE FROM APPRULES WHERE 1 = 1 AND NVL(APPTYPE,'NULL') = NVL('LN','NULL');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '01', 'LNMAST', 'STATUS', 'IN', -540001, 'Invalid status', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '02', 'LNMAST', 'PRINNML', '>=', -540002, 'Over normal principal', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '03', 'LNMAST', 'PRINOVD', '>=', -540003, 'Over overdue principal', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '04', 'LNMAST', 'INTNMLACR', '>=', -540004, 'Over normal interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '05', 'LNMAST', 'INTDUE', '>=', -540005, 'Over due interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '06', 'LNMAST', 'INTNMLPBL', '>=', -540006, 'Over payable interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '07', 'LNMAST', 'INTNMLOVD', '>=', -540007, 'Over overdue interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '08', 'LNMAST', 'APRLIMIT', '>=', -540110, 'Over approved limit', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '09', 'LNMAST', 'LNTYPE', 'NI', -540008, 'Invalid loan type', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '10', 'LNMAST', 'INTOVDACR', '>=', -540009, 'Over overdue interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '11', 'LNMAST', 'STATUS', 'NI', -540001, 'Invalid status', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '12', 'LNMAST', 'PRINNML', '==', -540002, 'Over normal principal', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '13', 'LNMAST', 'PRINOVD', '==', -540003, 'Over overdue principal', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '14', 'LNMAST', 'INTNMLACR', '==', -540004, 'Over normal interest', '', '4');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '15', 'LNMAST', 'INTDUE', '==', -540005, 'Over due interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '16', 'LNMAST', 'INTNMLOVD', '==', -540007, 'Over overdue interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '17', 'LNMAST', 'INTOVDACR', '==', -540009, 'Over overdue interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '18', 'LNMAST', 'OPRINNML', '>=', -540011, 'Over T+0 normal principal', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '19', 'LNMAST', 'OINTDUE', '>=', -540012, 'Over T+0 due interest', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '20', 'LNAPPL', 'STATUS', 'IN', -540001, 'Invalid status', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '21', 'LNAPPL', 'INUSEDAMT', '==', -540010, 'Inused amount must be zero', '', '');Insert into APPRULES   (APPTYPE, RULECD, TBLNAME, FIELD, OPERAND, ERRNUM, ERRMSG, REFID, FLDRND) Values   ('LN', '22', 'LNMAST', 'FEEDUE', '>=', -540013, 'Over due fee', '', '');COMMIT;