%dw 1.0
%output application/json
%namespace ns0 http://tcc.e1.bssv.JP550300/
---
{
	doCreditCheckResponse: {
		//e1MessageList: {
				//(e1Messages.*e1Message map {
					//message: $.message,
					//messagePrefix: $.messagePrefix
				//})
		//} when payload.doCreditCheckResponse.e1MessageList != null and payload.doCreditCheckResponse.e1MessageList != '' otherwise '',
		(ARAccountCreditBalance: payload.doCreditCheckResponse.accountCreditBalance)  when payload.doCreditCheckResponse.accountCreditBalance != null  ,
		(ARAccountPurchasesonCredit:  payload.doCreditCheckResponse.accountPurchaseOnCredit) when  payload.doCreditCheckResponse.accountPurchaseOnCredit != null ,
		(ARAccountTotalCredit:  payload.doCreditCheckResponse.accountTotalCredit) when payload.doCreditCheckResponse.accountTotalCredit != null ,
		(tccCustomerId: flowVars.TCCCustomerID) when flowVars.TCCCustomerID != null
	}}