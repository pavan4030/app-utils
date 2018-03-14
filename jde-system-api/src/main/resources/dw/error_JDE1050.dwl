%dw 1.0
%output application/json
---
{
	"success": "false",
	"payload": flowVars.jdeCustomerSysAPIRequest,
	"error": {
		"code": "JDE1050",
		"description": "JDE - Customer - System API Service Exception -- Something is wrong in Service -- Please check with Administrator"
	}
}