%dw 1.0
%output application/java
---
payload map {
  orderId: trim $.orderId,
  commerceLineId: trim $.commerceLineId ,
  lineGrossProfit: $.lineGrossProfit,
  rebizPublished: $.rebizPublished
}