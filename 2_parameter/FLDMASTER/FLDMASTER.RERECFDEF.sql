SET DEFINE OFF;
                      A.ACTYPE      VALUE,
                      A.ACTYPE ||'' - ''||A.TYPENAME    DISPLAY,
                      A.DESCRIPTION
                  FROM RETYPE A, allcode
                    WHERE APPRV_STS = ''A''
                          AND RETYPE = ''D''
                          AND allcode.cdtype = ''RE''
                          AND allcode.cdname = ''AFSTATUS''
                          AND allcode.cdval = A.AFSTATUS
                    ORDER BY A.ACTYPE', ' ', '', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', '', '##########', '', '', '', '', 'C', 'Y', 'MAIN', '', '', '', 'N', 'P_IORO', 'Y', '', 'N', '', '', '', 'N');