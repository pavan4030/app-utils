%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.jdeCustomerWSRequest,
	"error": {
		"code": "JDE1060",
		"description": "Connection Exception - Customer JDE Service Failure"
	}
}