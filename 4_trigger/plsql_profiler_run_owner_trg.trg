SET DEFINE OFF;
CREATE OR REPLACE TRIGGER PLSQL_PROFILER_RUN_OWNER_TRG BEFORE INSERT OR UPDATE OF run_owner ON plsql_profiler_runs FOR EACH ROW
WHEN (new.run_owner IS NULL)
BEGIN :new.run_owner := user; END;
/