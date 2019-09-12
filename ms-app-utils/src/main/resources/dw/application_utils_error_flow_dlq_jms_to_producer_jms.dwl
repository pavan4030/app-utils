%dw 1.0
%output application/java
---

{   
    APP_ID : payload.appUtilPayload.APP_ID,
    APP_RESOURCE : payload.appUtilPayload.APP_RESOURCE,
    APP_METHOD : payload.appUtilPayload.APP_METHOD,
    CORRELATION_ID : payload.appUtilPayload.CORRELATION_ID,
    TRANSACTION_ID : payload.appUtilPayload.TRANSACTION_ID,
    REQUEST : payload.appUtilPayload.REQUEST,
    RESPONSE : payload.appUtilPayload.RESPONSE
}