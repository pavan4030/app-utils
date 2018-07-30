%dw 1.0
%output application/xml skipNullOn = "everywhere"
%namespace ns0 http://tcc.e1.bssv.JP554200/
---
{
	ns0#createSalesOrder: {
		orderHeader: {
			orderInfo: {
				orderDate: payload.OrderHeader.orderInfo.orderDate,
				orderId: payload.OrderHeader.orderInfo.orderId,
				(originalOrderDate: payload.OrderHeader.orderInfo.originalOrderDate) when payload.OrderHeader.orderInfo.originalOrderDate != null and payload.OrderHeader.orderInfo.originalOrderDate != "",
                originalOrderId: payload.OrderHeader.orderInfo.originalOrderId
			},
			customerInfo: {
				tccCustomerId: payload.OrderHeader.customerInfo.shellCustomerId when payload.OrderHeader.customerInfo.shellCustomerId? otherwise payload.OrderHeader.customerInfo.tccCustomerId,
				tccCustomerName: payload.OrderHeader.customerInfo.tccCustomerName,
				vzwCustomerType: payload.OrderHeader.customerInfo.vzwCustomerType
			},
			miscInfo: {
				defaultTaxRateUsed: payload.OrderHeader.miscInfo.defaultTaxRateUsed,
				CCRSCommissionCalculated: payload.OrderHeader.miscInfo.CCRScommissionCalculated
			},
			orderPriceInfo: {
				(currencyCode: payload.OrderHeader.orderPriceInfo.currencyCode) when payload.OrderHeader.orderPriceInfo? and payload.OrderHeader.orderPriceInfo.currencyCode?
			},
			agentInfo: {
				agentId: payload.OrderHeader.agentInfo.agentId,
				commissonableAgentId: payload.OrderHeader.agentInfo.commissionableAgentId
			},
			storeInfo: {
				physicalStoreInfo: {
					commissionableStoreInfo: {
						commissionableStoreId:  payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreId
					},
					physicalStoreId: payload.OrderHeader.storeInfo.physicalStoreInfo.physicalStoreId
				}
			}
		},
		commerceItems: {
			(payload.commerceItems.commerceItem map ((commerceItem , indexOfCommerceItem) -> {
				commerceItem: {
					commerceItemInfo: {
						skuId: "ORDEREDSKU" when (commerceItem.skuIdType == 'original' and ('ORDERED' == commerceItem.itemStatus or 'CANCELLED' == commerceItem.itemStatus) and not (['ORDEREDDPAYVOL','ORDEREDSECDEP','ORDEREDDPAYMAN'] contains commerceItem.skuId)) otherwise commerceItem.skuId ,
						(originalSKUId: commerceItem.skuId) when commerceItem.skuIdType == 'original' and ('ORDERED' == commerceItem.itemStatus or 'CANCELLED' == commerceItem.itemStatus) and not (['ORDEREDDPAYVOL','ORDEREDSECDEP','ORDEREDDPAYMAN'] contains commerceItem.skuId),
						quantity: commerceItem.quantity,
						commerceLineItemId: commerceItem.commercelineItemId,
						(fulfillmentDate: commerceItem.FulfillmentDate) when commerceItem.FulfillmentDate?,
						serialNumber: commerceItem.SerialNumber,
						itemStatus: commerceItem.itemStatus,
						
						preorderConfirmationId: commerceItem.preorderConfirmationId
					},
					serviceInfo:{
						serviceBasicInfo:{
							mobileNumber:commerceItem.mobileNumber,
							serviceTransactionID:commerceItem.serviceTransactionID,
							activationType: commerceItem.activationType,
							contractType: commerceItem.contractType,
							isBox:commerceItem.isBox
						}
					},
					itemPriceInfo: {
						itemPrice:{
							(
								authCode: commerceItem.authCode
							) when commerceItem.skuIdType == 'paymentGroup',
							itemPrice: commerceItem.amount when (commerceItem.skuIdType == 'original' and ('ORDERED' == commerceItem.itemStatus or 'CANCELLED' == commerceItem.itemStatus)) otherwise (commerceItem.listPrice when commerceItem.listPrice? otherwise commerceItem.commissionReceivableAmount),
							(itemCost: commerceItem.itemCost) when commerceItem.skuIdType == 'original' and  "SERVICE" == upper commerceItem.itemType
					}
				}
			}
			}
			))
		}
	}
}