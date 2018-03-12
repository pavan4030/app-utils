%dw 1.0
%output application/java
---
payload map ((payload01 , indexOfPayload01) -> {
	ExecutionMetrics: {
		ApplicationID: payload01.APP_ID as :string,
		ServerInfo: {
			HostName: payload01.SERVER_HOST,
			HostIP: payload01.SERVER_IP
		},
		BatchExecutionSummary: {
			SourceFileName: payload01.BATCH_SOURCE_FILE_NAME,
			BatchProcessName: payload01.BATCH_PROCESS_NAME,
			BatchRunId: payload01.BATCH_RUN_ID,
			Failed: payload01.FAILED_RECORDS when payload01.FAILED_RECORDS != null otherwise 0,
			ProcessedRecords: payload01.PROCESSED_RECORDS,
			Successful: payload01.SUCCESSFUL_RECORDS when payload01.SUCCESSFUL_RECORDS != null otherwise 0,
			Total: payload01.TOTAL_RECORDS when payload01.TOTAL_RECORDS != null otherwise 0,
			ErrorFile: payload01.SYSTEM_EXCPTN_DETAILS when payload01.SYSTEM_EXCPTN_DETAILS != null and payload01.FAILED_RECORDS != 0 otherwise '',
			ParentBatchRunId: payload01.PARENT_BATCH_RUN_ID when payload01.PARENT_BATCH_RUN_ID  != null otherwise payload01.BATCH_RUN_ID
		},
		Status: payload01.OVERALL_RESULT,
		MessagePriority: payload01.PRIORITY,
		MessageSummary: payload01.SUMMARY_MESSAGE,
		MessageDetails: payload01.DETAILED_MESSAGE
	}
}) groupBy $.ExecutionMetrics.BatchExecutionSummary.ParentBatchRunId pluck $