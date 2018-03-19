%dw 1.0
%output application/java
%namespace ns0 urn:vertexinc:o-series:tps:7:0
---
{	
APP_ID : p('oic.app.sync.recovery.appid'),
APP_RESOURCE : p('oic.app.sync.recovery.appresource'),
APP_METHOD : p('oic.app.sync.recovery.appmethod'),
CORRELATION_ID :  flowVars.appSyncCorrelationId,
TRANSACTION_ID : flowVars.appSyncTransactionId,
REQUEST : flowVars.appSyncRequest,
RESPONSE : flowVars.appSyncResponse
}