%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.jdeWSRequest,
	"error": {
		"code": "JDE1010",
		"description": "Connection Exception - SalesOrder JDE Service Failure"
	}
}