%dw 1.0
%output application/java
---
{
  status: "RECORD ALREADY EXISTS",
  orderId: payload.orderId,
  commerceLineId: payload.commerceLineId ,
  lineGrossProfit: payload.lineGrossProfit,
  rebizPublished: payload.rebizPublished
}