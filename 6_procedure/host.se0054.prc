SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SE0054"(PV_REFCURSOR IN OUT PKG_REPORT.REF_CURSOR,
                                     OPT          IN VARCHAR2,
                                     BRID         IN VARCHAR2,
                                     TLGOUPS      IN VARCHAR2,
                                     TLSCOPE      IN VARCHAR2,
                                     F_DATE       IN VARCHAR2,
                                     T_DATE       IN VARCHAR2,
                                     PV_CUSTODYCD IN VARCHAR2,
                                     PV_AFACCTNO  IN VARCHAR2,
                                     PLSENT       IN VARCHAR2) IS

  -- RP NAME : YEU CAU CHUYEN KHOAN CHUNG KHOAN TAT TOAN TAI KHOAN
  -- PERSON --------------DATE---------------------COMMENTS
  -- THANHNM            17/07/2012                 CREATE
  -- SE00310: report main
  -- ---------   ------  -------------------------------------------
  V_STRAFACCTNO        VARCHAR2(15);
  V_CUSTODYCD          VARCHAR2(15);
  V_CURRDATE           DATE;
  V_STRFULLNAME        VARCHAR2(200);
  V_STR_IDCODE      VARCHAR2(20);
  V_STR_IDPLACE      VARCHAR2(200);
  V_STR_IDDATE     VARCHAR2(200);
  CUR                  PKG_REPORT.REF_CURSOR;

  V_INBRID    VARCHAR2(4);
  V_STRBRID   VARCHAR2(50);
  V_STROPTION VARCHAR2(5);

BEGIN
  -- GET REPORT'S PARAMETERS
  V_STROPTION := upper(OPT);
  V_INBRID    := BRID;
  if (V_STROPTION = 'A') then
    V_STRBRID := '%%';
  else
    if (V_STROPTION = 'B') then
      select br.mapid
        into V_STRBRID
        from brgrp br
       where br.brid = V_INBRID;
    else
      V_STRBRID := V_INBRID;
    end if;
  end if;

  V_CUSTODYCD     := UPPER(PV_CUSTODYCD);
  V_STR_IDCODE    := ' ';
  V_STR_IDPLACE    := ' ';
  V_STR_IDDATE     := ' ';

  SELECT TO_DATE(VARVALUE, 'DD/MM/RRRR')
    INTO V_CURRDATE
    FROM SYSVAR
   WHERE VARNAME = 'CURRDATE'
     AND GRNAME = 'SYSTEM';

  IF (PV_AFACCTNO <> 'ALL') THEN
    V_STRAFACCTNO := PV_AFACCTNO;
  ELSE
    V_STRAFACCTNO := '%';
  END IF;

  SELECT FULLNAME,IDCODE,to_char(IDDATE,'dd/MM/yyyy'),IDPLACE
    INTO V_STRFULLNAME,V_STR_IDCODE,V_STR_IDDATE,V_STR_IDPLACE
    FROM CFMAST
   WHERE custodycd = V_CUSTODYCD;

  --LAY THONG TIN CHINH

  -- GET REPORT'S DATA
  OPEN PV_REFCURSOR FOR

    SELECT
          SB.PARVALUE,
           SB.SYMBOL,

           ((case
             when sb.tradeplace = '009' then
              '013'
             else
              '012'
           end) || (case
             when DT.SE_TYPE IN ('8', '7') then
              '72'
             else
              (case
                when DT.SE_TYPE = '1' THEN
                 '12'
                ELSE
                 '22'
              END)
           end) || '.' || DT.MA_TVLK_NHAN) TK_NO,
           ((case
             when sb.tradeplace = '009' then
              '013'
             else
              '012'
           end) || (case
             when DT.SE_TYPE IN ('8', '7') then
              '72'
             else
              (case
                when DT.SE_TYPE = '1' THEN
                 '12'
                ELSE
                 '22'
              END)
           end) || '.009') TK_CO,
           DT.CUSTODYCD,

           /* (case when sb.tradeplace='002' then 'HNX'
           when sb.tradeplace='001' then 'HOSE'
           when sb.tradeplace='005' then 'UPCOM'
           when sb.tradeplace='007' then 'TR?I PHI? CHUY? BI?T'
           when sb.tradeplace='008' then 'T? PHI?U'
           when sb.tradeplace='009' then '?CNY'
           else '' end)*/
           A0.CDCONTENT SAN_GD,

           DT.NAMT,
           DT.SE_TYPE,
           V_STRFULLNAME FULLNAME,
           NVL(DeP.FULLNAME, ' ') TEN_TVLK_NHAN,
           MA_TVLK_NHAN,
           SO_TKLK_NHAN,
           TEN_NGUOI_NHAN,
           PLSENT PL_SENT,
           V_STR_IDCODE  IDCODE,
       V_STR_IDPLACE    IDPLACE,
       V_STR_IDDATE       IDDATE,
       cf.sex
      FROM SBSECURITIES SB,
           ALLCODE A0,
         (select TXDATE,
                TXNUM,
                custodycd,
                MSGACCT,
                MA_TVLK_NHAN,
                SO_TKLK_NHAN,
                TEN_NGUOI_NHAN,
                SUM(namt) namt,
                TRADEPLACE,
                codeid,
                SE_TYPE
                 from   (select tl.TXDATE,
                   tl.TXNUM,
                   cf.custodycd,
                   tl.MSGACCT,
                   ser.inwardname MA_TVLK_NHAN,
                   ser.rcustodycd SO_TKLK_NHAN,
                   ser.infullname TEN_NGUOI_NHAN,
                   se.trade+se.dtoclose namt,
                   max(SB.TRADEPLACE) TRADEPLACE,
                   max(nvl(sb.refcodeid, sb.codeid)) codeid,
                   (case
                         when sb.refcodeid is null then
                          '1'
                         else
                          '7'
                       end) SE_TYPE
              from (select tg.autoid,
                           tg.tlid,
                           tg.offid,
                           tg.tltxcd,
                           tg.MSGACCT,
                           tg.txnum,
                           tg.txdate,
                           tg.CFCUSTODYCD
                      from VW_TLLOG_ALL tg  where   tg.txdate >= TO_DATE(F_DATE, 'DD/MM/YYYY')
                       AND tg.txdate <= TO_DATE(T_DATE, 'DD/MM/YYYY')
                       and tg.tltxcd in ('0088')) tl,
                   cfmast cf,
                   semast se,
                   sbsecurities sb,
                    SETYPETRF ser, afmast af
             where cf.custodycd = tl.CFCUSTODYCD
               and af.custid = tl.MSGACCT
               and af.custid = cf.custid
               and se.afacctno = af.acctno
               and se.codeid =  sb.codeid
               and ser.txdate = tl.txdate
               and ser.txnum = tl.txnum
               and ser.tltxcd = '0088'
               and cf.custodycd like V_CUSTODYCD
               and tl.MSGACCT like V_STRAFACCTNO
               --and se.trade > 0
             group by tl.TXDATE,
                      tl.TXNUM,
                      cf.custodycd,
                      tl.MSGACCT,
                      ser.inwardname,
                      ser.rcustodycd,
                      ser.infullname,
                      se.trade,se.dtoclose,
                      sb.refcodeid

            UNION all
            select tl.TXDATE,
                   tl.TXNUM,
                   cf.custodycd,
                   tl.MSGACCT,
                   ser.inwardname MA_TVLK_NHAN,
                   ser.rcustodycd SO_TKLK_NHAN,
                   ser.infullname TEN_NGUOI_NHAN,
                   nvl(se.BLOCKED,0)+se.blockdtoclose namt,
                   max(SB.TRADEPLACE) TRADEPLACE,
                   max(nvl(sb.refcodeid, sb.codeid)) codeid,
                   (case
                         when sb.refcodeid is null then
                          '2'
                         else
                          '8'
                       end) SE_TYPE
              from (select tg.autoid,
                           tg.tlid,
                           tg.offid,
                           tg.tltxcd,
                           tg.MSGACCT,
                           tg.txdate,
                           tg.txnum,
                           tg.CFCUSTODYCD
                      from VW_TLLOG_ALL tg where tg.txdate >= TO_DATE(F_DATE, 'DD/MM/YYYY')
                       AND tg.txdate <= TO_DATE(T_DATE, 'DD/MM/YYYY')
                       and tg.tltxcd in ('0088')) tl,
                   cfmast cf,
                   semast se,
                   sbsecurities sb,
                   SETYPETRF ser, afmast af
             where cf.custodycd = tl.cfcustodycd
               and af.custid = tl.MSGACCT
               and se.codeid = sb.codeid
               and cf.custid = af.custid
               and se.afacctno = af.acctno
               and ser.txdate = tl.txdate
               and ser.txnum = tl.txnum
               and ser.tltxcd = '0088'
               and cf.custodycd  like V_CUSTODYCD
               and tl.MSGACCT like V_STRAFACCTNO
              -- and se.trade > 0
             group by tl.TXDATE,
                      tl.TXNUM,
                      cf.custodycd,
                      tl.MSGACCT,
                      ser.inwardname,
                      ser.rcustodycd,
                      ser.infullname,
                      se.blocked,se.blockdtoclose,
                      sb.refcodeid

            ) DT WHERE 1=1 group by
            TXDATE,
                TXNUM,
                custodycd,
                MSGACCT,
                MA_TVLK_NHAN,
                SO_TKLK_NHAN,
                TEN_NGUOI_NHAN,
                TRADEPLACE,
                codeid,
                SE_TYPE
              ) DT  ,
           DEPOSIT_MEMBER dep,
           (SELECT *  FROM  CFMAST  WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, BRID, TLGOUPS)=0)cf
     WHERE SB.CODEID = DT.CODEID
       AND DT.CUSTODYCD LIKE V_CUSTODYCD
       AND DT.NAMT > 0
       and dt.MA_TVLK_NHAN = dep.DEPOSITID(+)
       and cf.custodycd = dt.custodycd
       and cf.status = 'G' -- tai khoan ke thua
       AND A0.CDTYPE = 'SE'
       AND A0.CDNAME = 'TRADEPLACE'
       and sb.sectype != '004'
       AND A0.CDVAL = SB.TRADEPLACE order by sb.symbol,dt.se_type

    ;

EXCEPTION
  WHEN OTHERS THEN
    RETURN;
END;

 
 
 
 
/
