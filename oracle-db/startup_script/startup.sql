-- Enable Oracle Script.
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- Create the datadog user. Replace the password placeholder with a secure password.
CREATE USER datadog IDENTIFIED BY datadog;

-- Grant access to the datadog user.
-- GRANT CONNECT TO datadog;
-- GRANT SELECT ON GV_$PROCESS TO datadog;
-- GRANT SELECT ON gv_$sysmetric TO datadog;
-- GRANT SELECT ON sys.dba_data_files TO datadog;
-- GRANT SELECT ON sys.dba_tablespaces TO datadog;
-- GRANT SELECT ON sys.dba_tablespace_usage_metrics TO datadog;

grant create session to datadog ;
grant select on v_$session to datadog ;
grant select on v_$database to datadog ;
grant select on v_$containers to datadog;
grant select on v_$sqlstats to datadog ;
grant select on v_$instance to datadog ;
grant select on dba_feature_usage_statistics to datadog ;
grant select on V_$SQL_PLAN_STATISTICS_ALL to datadog ;
grant select on V_$PROCESS to datadog ;
grant select on V_$SESSION to datadog ;
grant select on V_$CON_SYSMETRIC to datadog ;
grant select on CDB_TABLESPACE_USAGE_METRICS to datadog ;
grant select on CDB_TABLESPACES to datadog ;
grant select on V_$SQLCOMMAND to datadog ;
grant select on V_$DATAFILE to datadog ;
grant select on V_$SYSMETRIC to datadog ;
grant select on V_$SGAINFO to datadog ;
grant select on V_$PDBS to datadog ;
grant select on CDB_SERVICES to datadog ;
grant select on V_$OSSTAT to datadog ;
grant select on V_$PARAMETER to datadog ;
grant select on V_$SQLSTATS to datadog ;
grant select on V_$CONTAINERS to datadog ;
grant select on V_$SQL_PLAN_STATISTICS_ALL to datadog ;
grant select on V_$SQL to datadog ;
grant select on V_$PGASTAT to datadog ;
grant select on v_$asm_diskgroup to datadog ;
grant select on v_$rsrcmgrmetric to datadog ;
grant select on v_$dataguard_config to datadog ;
grant select on v_$dataguard_stats to datadog ;
grant select on v_$transaction to datadog;
grant select on v_$locked_object to datadog;
grant select on dba_objects to datadog;
grant select on cdb_data_files to datadog;
grant select on dba_data_files to datadog;

CREATE OR REPLACE VIEW dd_session AS
SELECT /*+ push_pred(sq) push_pred(sq_prev) */
  s.indx as sid,
  s.ksuseser as serial#,
  s.ksuudlna as username,
  DECODE(BITAND(s.ksuseidl, 9), 1, 'ACTIVE', 0, DECODE(BITAND(s.ksuseflg, 4096), 0, 'INACTIVE', 'CACHED'), 'KILLED') as status,
  s.ksuseunm as osuser,
  s.ksusepid as process,
  s.ksusemnm as machine,
  s.ksusemnp as port,
  s.ksusepnm as program,
  DECODE(BITAND(s.ksuseflg, 19), 17, 'BACKGROUND', 1, 'USER', 2, 'RECURSIVE', '?') as type,
  s.ksusesqi as sql_id,
  sq.force_matching_signature as force_matching_signature,
  s.ksusesph as sql_plan_hash_value,
  s.ksusesesta as sql_exec_start,
  s.ksusesql as sql_address,
  CASE WHEN BITAND(s.ksusstmbv, POWER(2, 04)) = POWER(2, 04) THEN 'Y' ELSE 'N' END as in_parse,
  CASE WHEN BITAND(s.ksusstmbv, POWER(2, 07)) = POWER(2, 07) THEN 'Y' ELSE 'N' END as in_hard_parse,
  s.ksusepsi as prev_sql_id,
  s.ksusepha as prev_sql_plan_hash_value,
  s.ksusepesta as prev_sql_exec_start,
  sq_prev.force_matching_signature as prev_force_matching_signature,
  s.ksusepsq as prev_sql_address,
  s.ksuseapp as module,
    s.ksuseact as action,
    s.ksusecli as client_info,
    s.ksuseltm as logon_time,
    s.ksuseclid as client_identifier,
    s.ksusstmbv as op_flags,
    decode(s.ksuseblocker,
        4294967295, 'UNKNOWN', 4294967294, 'UNKNOWN', 4294967293, 'UNKNOWN', 4294967292, 'NO HOLDER', 4294967291, 'NOT IN WAIT',
        'VALID'
    ) as blocking_session_status,
    DECODE(s.ksuseblocker,
        4294967295, TO_NUMBER(NULL), 4294967294, TO_NUMBER(NULL), 4294967293, TO_NUMBER(NULL),
        4294967292, TO_NUMBER(NULL), 4294967291, TO_NUMBER(NULL), BITAND(s.ksuseblocker, 2147418112) / 65536
    ) as blocking_instance,
    DECODE(s.ksuseblocker,
        4294967295, TO_NUMBER(NULL), 4294967294, TO_NUMBER(NULL), 4294967293, TO_NUMBER(NULL),
        4294967292, TO_NUMBER(NULL), 4294967291, TO_NUMBER(NULL), BITAND(s.ksuseblocker, 65535)
    ) as blocking_session,
    DECODE(s.ksusefblocker,
        4294967295, 'UNKNOWN', 4294967294, 'UNKNOWN', 4294967293, 'UNKNOWN', 4294967292, 'NO HOLDER', 4294967291, 'NOT IN WAIT', 'VALID'
    ) as final_blocking_session_status,
    DECODE(s.ksusefblocker,
        4294967295, TO_NUMBER(NULL), 4294967294, TO_NUMBER(NULL), 4294967293, TO_NUMBER(NULL), 4294967292, TO_NUMBER(NULL),
        4294967291, TO_NUMBER(NULL), BITAND(s.ksusefblocker, 2147418112) / 65536
    ) as final_blocking_instance,
    DECODE(s.ksusefblocker,
        4294967295, TO_NUMBER(NULL), 4294967294, TO_NUMBER(NULL), 4294967293, TO_NUMBER(NULL), 4294967292, TO_NUMBER(NULL),
        4294967291, TO_NUMBER(NULL), BITAND(s.ksusefblocker, 65535)
    ) as final_blocking_session,
    DECODE(w.kslwtinwait,
        1, 'WAITING', decode(bitand(w.kslwtflags, 256), 0, 'WAITED UNKNOWN TIME',
        decode(round(w.kslwtstime / 10000), 0, 'WAITED SHORT TIME', 'WAITED KNOWN TIME'))
    ) as STATE,
    e.kslednam as event,
    e.ksledclass as wait_class,
    w.kslwtstime as wait_time_micro,
    c.name as pdb_name,
    sq.sql_text as sql_text,
    sq.sql_fulltext as sql_fulltext,
    sq_prev.sql_fulltext as prev_sql_fulltext,
    comm.command_name
FROM
  x$ksuse s,
  x$kslwt w,
  x$ksled e,
  v$sql sq,
  v$sql sq_prev,
  v$containers c,
  v$sqlcommand comm
WHERE
  BITAND(s.ksspaflg, 1) != 0
  AND BITAND(s.ksuseflg, 1) != 0
  AND s.inst_id = USERENV('Instance')
  AND s.indx = w.kslwtsid
  AND w.kslwtevt = e.indx
  AND s.ksusesqi = sq.sql_id(+)
  AND decode(s.ksusesch, 65535, TO_NUMBER(NULL), s.ksusesch) = sq.child_number(+)
  AND s.ksusepsi = sq_prev.sql_id(+)
  AND decode(s.ksusepch, 65535, TO_NUMBER(NULL), s.ksusepch) = sq_prev.child_number(+)
  AND s.con_id = c.con_id(+)
  AND s.ksuudoct = comm.command_type(+)
;

GRANT SELECT ON dd_session TO datadog ;
