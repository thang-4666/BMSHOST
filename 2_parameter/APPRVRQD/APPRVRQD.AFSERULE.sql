SET DEFINE OFF;DELETE FROM APPRVRQD WHERE 1 = 1 AND NVL(OBJNAME,'NULL') = NVL('AFSERULE','NULL');Insert into APPRVRQD   (OBJNAME, RQDSTRING, MAKERID, MAKERDT, APPRVID, APPRVDT, MODNUM, ADDATAPPR, EDITATAPPR, DELATAPPR, ADDCHILDATAPPR) Values   ('AFSERULE', 'ALL', '', TO_DATE('','DD/MM/RRRR'), '', TO_DATE('','DD/MM/RRRR'), 1, 'N', 'Y', 'Y', 'Y');COMMIT;