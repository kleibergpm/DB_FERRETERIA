-- Job 1: Recalcular totales de facturas cada noche
BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_RECALCULAR_FACTURAS',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN UPDATE facturas f SET f.total = (SELECT SUM(subtotal) FROM detalle_factura d WHERE d.id_factura = f.id_factura); END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY; BYHOUR=2;',
    enabled         => TRUE
  );
END;
/

-- Job 2: Desactivar promociones vencidas
BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_DESACTIVAR_PROMOCIONES',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN UPDATE promociones SET activa = 0 WHERE fecha_fin < SYSDATE; END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=HOURLY; INTERVAL=1;',
    enabled         => TRUE
  );
END;
/

-- Job 3: Registrar actividad del sistema
BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_LOG_AUDITORIA',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN INSERT INTO logs_auditoria (id_log, tabla_afectada, accion, usuario, descripcion) VALUES (seq_detalle_factura.NEXTVAL, ''SISTEMA'', ''JOB'', USER, ''Verificación de mantenimiento''); END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY; BYHOUR=1;',
    enabled         => TRUE
  );
END;
/
