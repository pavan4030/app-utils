%dw 1.0
%output application/xml
%namespace ns0 http://tcc.e1.bssv.JP550300/
---
{
	ns0#doCreditCheck: {
		customerIdTCC: payload.creditCheckRequest.tccCustomerId
	}
}