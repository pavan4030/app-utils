%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.jdeSysAPIRequest,
	"error": {
		"code": "JDE1020",
		"description": "JDE - System API Service Exception -- Something is wrong in Service -- Please check with Administrator"
	}
}