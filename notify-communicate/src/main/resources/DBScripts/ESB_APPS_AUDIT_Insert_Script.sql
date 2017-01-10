INSERT
INTO ESB_APPS_AUDIT
  (
    ESB_APPS_AUDIT_ID,
    APP_ID,
    BATCH_RUN_ID,
    PARENT_BATCH_RUN_ID,
    PRIORITY,
    SUMMARY_MESSAGE,
    DETAILED_MESSAGE,
    SERVER_HOST,
    SERVER_IP,
    CREATE_TS,
    UPDATE_TS
  )
  VALUES
  (
    MULE_OWNER.ESB_APPS_AUDIT_SEQ.NEXTVAL,
    102,
    47601,
    NULL,
    NULL,
    'Execution was successful',
    'These are the message Details',
    'vserver15664',
    '10.206.14.5',
    sysdate,
    sysdate
  );