%dw 1.0
%output application/java
---
(payload.id) when payload.id? and payload.id != '' otherwise ""