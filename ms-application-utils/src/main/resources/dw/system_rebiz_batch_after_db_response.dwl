%dw 1.0
%output application/java
---
{
  status: "SUCCESS",
  orderId: payload.orderId,
  commerceLineId: payload.commerceLineId ,
  lineGrossProfit: payload.lineGrossProfit,
  rebizPublished: payload.rebizPublished
}