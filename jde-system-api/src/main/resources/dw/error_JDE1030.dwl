%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.jdeWSRequest,
	"error": {
		"code": "JDE1030",
		"description": flowVars.exceptionMsg
	}
}