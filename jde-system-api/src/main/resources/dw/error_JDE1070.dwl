%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.jdeCustomerWSRequest,
	"error": {
		"code": "JDE1070",
		"description": flowVars.exceptionMsg
	}
}