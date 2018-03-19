%dw 1.0
%output application/java
---
{
	systemName: p('jde.salesorder.mail.systemname'),
	HostName:outboundProperties.host,
	HostIP:outboundProperties.ipAddress,
	mailVerboserecipients: p('jde.systemapi.verbose.mailrecipients'),
	mailGenericrecipients: p('jde.systemapi.generic.mailrecipients'),
	(request: outboundProperties.request),
	exception: outboundProperties.exceptionMsg,
	mailsubject : p('smtp.mail.jde.salesorder.subject.prefix') ++ outboundProperties.mailsubject,
	header: p('jde.salesorder.mail.header'),
	salesorderFailureLink:p('salesorder.failure.alert.link') ++ ((outboundProperties.orderId) when outboundProperties.orderId? otherwise '') ++ "&startDate=" ++ outboundProperties.startDate as :string {format: "yyyy/MM/dd"}
}