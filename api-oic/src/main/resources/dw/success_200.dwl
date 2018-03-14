%dw 1.0
%output application/json
---
{
	success:{
		"code":"200",
		"message":"SalesOrder - " ++ flowVars.salesOrderId ++ " is pushed to APP SYNC RECOVERY DB Successfully"
	}
	
}