%dw 1.0
%output application/java
%namespace ns0 urn:vertexinc:o-series:tps:7:0
---
{	
APP_ID : p('jde.app.salesorder.recovery.appid'),
APP_RESOURCE : p('jde.app.salesorder.recovery.appresource'),
APP_METHOD : p('jde.app.salesorder.recovery.appmethod'),
CORRELATION_ID :  flowVars.appSyncCorrelationId,
TRANSACTION_ID : flowVars.appSyncTransactionId,
REQUEST : flowVars.appSyncRequest,
RESPONSE : flowVars.appSyncResponse
}