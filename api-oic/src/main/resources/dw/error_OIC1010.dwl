%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.oicWSRequest,
	"error": {
		"code": "OIC1010",
		"description": "Connection Exception - SalesOrder OIC Service Failure"
	}
}