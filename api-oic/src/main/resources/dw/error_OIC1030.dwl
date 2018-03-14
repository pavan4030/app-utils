%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.oicWSRequest,
	"error": {
		"code": "OIC1030",
		"description": flowVars.exceptionMsg
	}
}