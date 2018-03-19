%dw 1.0
%output application/java
%namespace ns0 urn:vertexinc:o-series:tps:7:0
---
{	
APP_ID : outboundProperties.app_Id,
APP_RESOURCE : outboundProperties.appResource,
APP_METHOD : outboundProperties.appMethod,
CORRELATION_ID : flowVars.correlationId,
TRANSACTION_ID : flowVars.transactionId,
REQUEST : flowVars.request,
RESPONSE : flowVars.response
}