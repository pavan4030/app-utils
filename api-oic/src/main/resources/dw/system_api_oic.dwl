%dw 1.0
%output application/java
---
{
	systemName: p('oic.mail.systemname'),
	HostName:outboundProperties.host,
	HostIP:outboundProperties.ipAddress,
	mailVerboserecipients: p('smtp.oic.verbose.mailrecipients'),
	mailGenericrecipients: p('smtp.oic.generic.mailrecipients'),
	(request: outboundProperties.request),
	exception: outboundProperties.exceptionMsg,
	mailsubject : p('smtp.mail.subject.prefix') ++ outboundProperties.mailsubject,
	header: p('oic.mail.header'),
	salesorderFailureLink:p('salesorder.failure.alert.link') ++ ((outboundProperties.orderId) when outboundProperties.orderId? otherwise '') ++ "&startDate=" ++ outboundProperties.startDate as :string {format: "yyyy/MM/dd"}
}