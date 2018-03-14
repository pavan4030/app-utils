%dw 1.0
%output application/xml
%namespace ns0 http://xmlns.oracle.com/apps/incentiveCompensation/cn/transactionProcessing/transactionManagement/publicService/types/
%namespace ns1 http://xmlns.oracle.com/apps/incentiveCompensation/cn/transactionProcessing/transactionManagement/publicService/
%namespace ns2 http://xmlns.oracle.com/adf/svc/types/
---
{
	ns0#processIncentiveTransactionStaging: {
		ns0#changeOperation: 'Merge',
		(payload.commerceItems.commerceItem map ((transactionStagingPayload, transactionStagingPayloadIndex) -> {
		
		ns0#incentiveTransactionStaging: {
			ns1#Attribute1: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreId,
			ns1#Attribute11: payload.OrderHeader.agentInfo.agentId,
			ns1#Attribute15: payload.OrderHeader.customerInfo.tccCustomerName,
			ns1#Attribute2: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreName,
			ns1#Attribute25: payload.OrderHeader.agentInfo.commissionableAgentId,
			ns1#Attribute26: payload.OrderHeader.agentInfo.commissionableAgentOrgRole,
			ns1#Attribute29: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreAreaId,
			ns1#Attribute4: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreDistrictId,
			ns1#Attribute5: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreDistrictName,
			ns1#Attribute6: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreMarketId,
			ns1#Attribute7: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreMarketName,
			ns1#Attribute8: payload.OrderHeader.storeInfo.commissionableStoreInfo.commissionableStoreAreaName,
			ns1#Attribute41: transactionStagingPayload.commercelineItemId,
			ns1#Attribute16: transactionStagingPayload.skuId,
			ns1#Attribute17: transactionStagingPayload.skuDescription,
			ns1#Attribute19: transactionStagingPayload.categoryId,
			ns1#TransactionQuantity: transactionStagingPayload.quantity,
			ns1#SourceEventDate: transactionStagingPayload.FulfillmentDate,
			ns1#Attribute44: transactionStagingPayload.itemType,
			ns1#AttributeNumber7: (transactionStagingPayload.listPrice when transactionStagingPayload.listPrice? otherwise transactionStagingPayload.commissionPayableAmount) - (transactionStagingPayload.itemCost when transactionStagingPayload.itemCost != "" otherwise '0'),
			ns1#Attribute14: transactionStagingPayload.serviceTransactionID,
			ns1#Attribute12: transactionStagingPayload.mobileNumber,
			ns1#Attribute42: transactionStagingPayload.deviceCategory,
			ns1#Attribute39: transactionStagingPayload.activationType,
			ns1#Attribute40: transactionStagingPayload.contractType,
			ns1#AttributeNumber1: transactionStagingPayload.itemCost when transactionStagingPayload.skuIdType == 'original' otherwise '0',
			ns1#InvoiceNumber: payload.OrderHeader.orderInfo.orderId,
			ns1#ParticipantId: payload.OrderHeader.agentInfo.commissionableAgentParticipantId,
			ns1#SourceCurrencyCode: transactionStagingPayload.currencyCode,
			ns1#SourceCurrencyTransactionAmount: transactionStagingPayload.listPrice when transactionStagingPayload.listPrice? otherwise transactionStagingPayload.commissionPayableAmount,
			ns1#SourceTrxNumber : (([payload.OrderHeader.orderInfo.orderId, (transactionStagingPayload.commercelineItemId splitBy '-')[1] when (sizeOf (transactionStagingPayload.commercelineItemId splitBy '-')) > 1 otherwise transactionStagingPayload.commercelineItemId] joinBy "-" ) ++ getCount(transactionStagingPayload.skuIdType)),
				//when (sizeOf (([payload.OrderHeader.orderInfo.orderId, (transactionStagingPayload.commercelineItemId splitBy '-')[1] when (sizeOf (transactionStagingPayload.commercelineItemId splitBy '-')) > 1 otherwise transactionStagingPayload.commercelineItemId] joinBy "-" ) ++ getCount(transactionStagingPayload.skuIdType))) > 30 
				//otherwise ([payload.OrderHeader.orderInfo.orderId, (transactionStagingPayload.commercelineItemId splitBy '-')[1] when (sizeOf (transactionStagingPayload.commercelineItemId splitBy '-')) > 1 otherwise transactionStagingPayload.commercelineItemId] joinBy "-" ) ++ getCount(transactionStagingPayload.skuIdType),
			//(ns1#SourceTrxNumber : [payload.OrderHeader.orderInfo.orderId,transactionStagingPayload.commercelineItemId,'00' ++ transactionStagingPayloadIndex] joinBy "-" ) when transactionStagingPayload.skuIdType != 'original',
			//ns1#CreditedParticipantId: payload.OrderHeader.agentInfo.commissionableAgentParticipantId,
			ns1#TransactionType : p('TransactionType'),
			ns1#BusinessUnitId : p('oic.BusinessUnitId'),
			ns1#Attribute3 : p('Attribute3'),
			ns1#Attribute27 : p('Attribute27')
			//numberCount: numberCount(transactionStagingPayload.skuIdType)
			
		}
		})),
		ns0#processControl: {
			ns2#returnMode: 'Key',
			ns2#exceptionReturnMode: 'Key',
			ns2#partialFailureAllowed: true as :boolean
		}
	} 
	
	} when (sizeOf payload.commerceItems.commerceItem) > 0 otherwise {NoXML: 'No tag'}