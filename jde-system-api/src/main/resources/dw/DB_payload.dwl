%dw 1.0
%output application/java
---
payload map {
	ID: $.ID,
	CREATE_TS : $.CREATE_TS,
	UPDATE_TS: $.UPDATE_TS,
	REQUEST : ($.REQUEST.characterStream) when $.REQUEST? otherwise ""
}