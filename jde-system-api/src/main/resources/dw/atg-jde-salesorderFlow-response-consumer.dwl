%dw 1.0
%output application/xml
%namespace ns0 http://tcc.e1.bssv.JP554200/
---
{
	ns0#createSalesOrderResponse: {
		orderCompany: payload.ns0#createSalesOrderResponse.orderCompany,
		orderNumber: payload.ns0#createSalesOrderResponse.orderNumber,
		orderNumberTCC: payload.ns0#createSalesOrderResponse.orderNumberTCC,
		orderType: payload.ns0#createSalesOrderResponse.orderType
	}
}