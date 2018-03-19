%dw 1.0
%output application/json
---
{
	OrderHeader: {
		agentInfo: {
			CommissionableAgentName: payload.OrderHeader.agentInfo.CommissionableAgentName,
			agentId: payload.OrderHeader.agentInfo.agentId,
			commissionableAgentId: payload.OrderHeader.agentInfo.commissionableAgentId,
			commissionableAgentOrgRole: payload.OrderHeader.agentInfo.commissionableAgentOrgRole,
			commissionableAgentParticipantId: payload.OrderHeader.agentInfo.commissionableAgentParticipantId
		},
		customerInfo: {
			tccCustomerId: payload.OrderHeader.customerInfo.tccCustomerId,
			shellCustomerId: payload.OrderHeader.customerInfo.shellCustomerID,
			tccCustomerName: payload.OrderHeader.customerInfo.tccCustomerName,
			tccCustomerType: payload.OrderHeader.customerInfo.tccCustomerType
		},
		miscInfo: {
			CCRScommissionCalculated: payload.OrderHeader.miscInfo.CCRScommissionCalculated,
			defaultTaxRateUsed: payload.OrderHeader.miscInfo.defaultTaxRateUsed
		},
		orderInfo: {
			orderDate: parseDateAndConvert(payload.OrderHeader.orderInfo.orderDate) when payload.OrderHeader.orderInfo.orderDate != null and payload.OrderHeader.orderInfo.orderDate !="" otherwise "",
			orderId: payload.OrderHeader.orderInfo.orderId,
			orderStatus: payload.OrderHeader.orderInfo.orderStatus,
			originalOrderDate: parseDateAndConvert(payload.OrderHeader.orderInfo.originalOrderDate) when payload.OrderHeader.orderInfo.originalOrderDate != null and payload.OrderHeader.orderInfo.originalOrderDate !="" otherwise "",
			originalOrderId: payload.OrderHeader.orderInfo.originalOrderId
		},
		orderPriceInfo: {
			amount: payload.OrderHeader.orderPriceInfo.amount,
			currencyCode: payload.OrderHeader.orderPriceInfo.currencyCode,
			discounted: payload.OrderHeader.orderPriceInfo.discounted,
			tax: payload.OrderHeader.orderPriceInfo.tax,
			total: payload.OrderHeader.orderPriceInfo.total
		},
		storeInfo: {
			commissionableStoreInfo: {
				commissionableStoreAreaId: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreAreaId,
				commissionableStoreAreaName: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreAreaName,
				commissionableStoreDistrictId: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreDistrictId,
				commissionableStoreDistrictName: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreDistrictName,
				commissionableStoreId: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreId,
				commissionableStoreMarketId: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreMarketId,
				commissionableStoreMarketName: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreMarketName,
				commissionableStoreName: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreName
			},
			physicalStoreInfo: {
				physicalStoreId: payload.OrderHeader.storeInfo.physicalStoreInfo.physicalStoreId,
				physicalStoreZipCode: payload.OrderHeader.storeInfo.physicalStoreInfo.physicalStoreZipCode
			}
		}
	},
	commerceItems:{
		commerceItem: payload.commerceItems.commerceItem map ((salesOrderSKUIdsPayload, salesOrderSKUIdsPayloadIndex) -> {
			(skuId: salesOrderSKUIdsPayload.skuId) when salesOrderSKUIdsPayload.skuId?,
			(commercelineItemId: salesOrderSKUIdsPayload.commercelineItemId) when salesOrderSKUIdsPayload.commercelineItemId?,
			(skuIdType: salesOrderSKUIdsPayload.skuIdType) when salesOrderSKUIdsPayload.skuIdType?,
			(listPrice: salesOrderSKUIdsPayload.listPrice) when salesOrderSKUIdsPayload.listPrice?,
			(amount: salesOrderSKUIdsPayload.amount) when salesOrderSKUIdsPayload.amount?,
			(itemCost: salesOrderSKUIdsPayload.itemCost) when salesOrderSKUIdsPayload.itemCost?,
			(itemStatus: salesOrderSKUIdsPayload.itemStatus) when salesOrderSKUIdsPayload.itemStatus?,
			(discountType: salesOrderSKUIdsPayload.discountType) when salesOrderSKUIdsPayload.discountType?,
			(impositionTypeId: salesOrderSKUIdsPayload.impositionTypeId) when salesOrderSKUIdsPayload.impositionTypeId?,
			(commissionType: salesOrderSKUIdsPayload.commissionType) when salesOrderSKUIdsPayload.commissionType?,
			(SerialNumber: salesOrderSKUIdsPayload.SerialNumber) when salesOrderSKUIdsPayload.SerialNumber?,
			(skuDescription: salesOrderSKUIdsPayload.skuDescription) when salesOrderSKUIdsPayload.skuDescription?,
	        (categoryId: salesOrderSKUIdsPayload.categoryId) when salesOrderSKUIdsPayload.categoryId?,
	        (quantity: salesOrderSKUIdsPayload.quantity) when salesOrderSKUIdsPayload.quantity?,
	        
            FulfillmentDate: parseDateAndConvert(salesOrderSKUIdsPayload.FulfillmentDate) when salesOrderSKUIdsPayload.FulfillmentDate != null and salesOrderSKUIdsPayload.FulfillmentDate !="" otherwise "", 
	        
	        (itemType: salesOrderSKUIdsPayload.itemType) when salesOrderSKUIdsPayload.itemType?,
	        (grossProfit: salesOrderSKUIdsPayload.grossProfit) when salesOrderSKUIdsPayload.grossProfit?,
	        (serviceTransactionID: salesOrderSKUIdsPayload.serviceTransactionID) when salesOrderSKUIdsPayload.serviceTransactionID?,
	        (mobileNumber: salesOrderSKUIdsPayload.mobileNumber) when salesOrderSKUIdsPayload.mobileNumber?,
	        (deviceCategory: salesOrderSKUIdsPayload.deviceCategory) when salesOrderSKUIdsPayload.deviceCategory?,
	        (activationType: salesOrderSKUIdsPayload.activationType) when salesOrderSKUIdsPayload.activationType?,
	        (contractType: salesOrderSKUIdsPayload.contractType) when salesOrderSKUIdsPayload.contractType?,
       		(currencyCode: salesOrderSKUIdsPayload.currencyCode) when salesOrderSKUIdsPayload.currencyCode?,
			(authCode: salesOrderSKUIdsPayload.authCode) when salesOrderSKUIdsPayload.authCode?,
			(commissionPayableAmount: salesOrderSKUIdsPayload.commissionPayableAmount) when salesOrderSKUIdsPayload.commissionPayableAmount?,
            (commissionReceivableAmount: salesOrderSKUIdsPayload.commissionReceivableAmount) when salesOrderSKUIdsPayload.commissionReceivableAmount?,
            (categoryId: salesOrderSKUIdsPayload.categoryId) when salesOrderSKUIdsPayload.categoryId?,
            (preorderConfirmationId: salesOrderSKUIdsPayload.preorderConfirmationId) when salesOrderSKUIdsPayload.preorderConfirmationId?
		}) filter $.skuIdType != 'paymentGroup' and  $.skuIdType != 'taxPrice' and  $.skuIdType != 'valueAddedGainSpifAmount' and  $.skuIdType != 'devicePaymentGrossAmountFinanced' and  $.itemStatus != 'ORDERED' and (upper $.skuId) != 'VZWSECDEPSRV' and (upper $.skuId) != 'VZWDPAYMANSRV' and (upper $.skuId) != 'VZWDPAYVOLSRV' and $.itemStatus != 'CANCELLED' and payload.OrderHeader.miscInfo.CCRScommissionCalculated != 'N'
	}
	
}
