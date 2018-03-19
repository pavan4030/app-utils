%dw 1.0
%output application/xml
%namespace ns0 http://tcc.e1.bssv.JP550100/
---
{
	ns0#addOrUpdateCustomer: {
		customerIdTCC: payload.id,
		
		
		(firstName: payload.firstName ) when payload.customerType == 'CONSUMER' ,
		(lastName: payload.lastName) when payload.customerType == 'CONSUMER',
				
		customerType: 'C' when "BUSINESS" == payload.customerType otherwise 'N',
		(businessInfo: {
			businessName: subString(payload.businessDetails.businessName,0,40)
		}) when "BUSINESS" == payload.customerType,
		(payload.phoneDetails map {
			customerPhones:{
				phoneNumber: $.phoneNumber,
				phoneType: 'M' when "MOBILE" == upper $.type otherwise ('F' when "FAX" == upper $.type otherwise ('H' when "HOME" == upper $.type otherwise 'W'))
			}
		}),
		(customerEmails:{
				doNotEmail: '',
				emailAddress: payload.emailDetails[0].emailAddress,
				emailType: payload.emailDetails[0].type
			})when payload.emailDetails != null and payload.emailDetails[0] != null,
		
		shipAddress: '',
		(homeAddress:{
			addressLine1:payload.homeAddress.address1,
			addressLine2:payload.homeAddress.address2,
			city:payload.homeAddress.city,
			country:payload.homeAddress.country,
			doNotMail:payload.homeAddress.doNotMail,
			state:payload.homeAddress.state,
			zipCode:payload.homeAddress.postalCode
		}) when payload.homeAddress != null
	}
}