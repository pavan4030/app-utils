%dw 1.0
%output application/java
---
{
	systemName: p('jde.customer.mail.systemname'),
	HostName:outboundProperties.host,
	HostIP:outboundProperties.ipAddress,
	mailVerboserecipients: p('jde.systemapi.verbose.mailrecipients'),
	mailGenericrecipients: p('jde.systemapi.generic.mailrecipients'),
	(request: outboundProperties.request),
	exception: outboundProperties.exceptionMsg,
	mailsubject : p('smtp.mail.jde.customer.subject.prefix') ++ outboundProperties.mailsubject,
	header: p('jde.customer.mail.header')
}