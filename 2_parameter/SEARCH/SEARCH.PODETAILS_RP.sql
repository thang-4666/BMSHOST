SET DEFINE OFF;
          (CA.PBALANCE + CA.BALANCE) REPORTDATE_QTTY,
          ROUND(CASE WHEN
               (CA.PBALANCE + CA.BALANCE)<> 0 THEN (CA.BALANCE / (CA.PBALANCE + CA.BALANCE)) *100
               ELSE 100 END, 2) PERCENT_EXECUTE,
          (CA.QTTY+CA.PQTTY) TOTAL_QTTY, CA.QTTY QTTY, CM.EXPRICE EXPRICE, (CA.QTTY* CM.EXPRICE) AMT, CM.DESCRIPTION
   FROM CFMAST CF, AFMAST AF, CAMAST CM,
        (SELECT afacctno, camastid, sum(balance) balance, sum(pbalance) pbalance, sum(qtty) qtty, sum(pqtty) pqtty FROM CASCHD GROUP BY afacctno, camastid)CA,
        SBSECURITIES SB,
        (SELECT potxdate, potxnum, afacctno, camastid FROM PODETAILS GROUP BY potxdate, potxnum, afacctno, camastid UNION
         SELECT potxdate, potxnum, afacctno, camastid FROM PODETAILSHIST GROUP BY potxdate, potxnum, afacctno, camastid) PO
   WHERE CF.CUSTID = AF.CUSTID AND AF.ACCTNO = CA.AFACCTNO
         AND CA.CAMASTID = CM.CAMASTID AND CM.CATYPE=''014''
         AND PO.CAMASTID = CA.CAMASTID AND PO.AFACCTNO = AF.ACCTNO
         AND SB.CODEID = CM.CODEID
         AND ca.Afacctno = af.acctno', 'PODETAILS_RP', '', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');