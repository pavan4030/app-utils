%dw 1.0
%output application/java

---
ExecutionMetrics: {
		ApplicationID: payload.ExecutionMetrics.ApplicationID[0],
		ServerInfo: {
			HostName: payload.ExecutionMetrics.ServerInfo.HostName[0],
			HostIP: payload.ExecutionMetrics.ServerInfo.HostIP[0]
		},
		BatchExecutionSummary: {
			SourceFileName: payload.ExecutionMetrics.BatchExecutionSummary.SourceFileName[0] ,
			BatchProcessName: payload.ExecutionMetrics.BatchExecutionSummary.BatchProcessName[0],
			ParentBatchRunId: payload.ExecutionMetrics.BatchExecutionSummary.ParentBatchRunId[0],
			BatchRunId: payload.ExecutionMetrics.BatchExecutionSummary.BatchRunId[0],
			Failed: payload.ExecutionMetrics.BatchExecutionSummary.Failed reduce $$ + $,
			ProcessedRecords: payload.ExecutionMetrics.BatchExecutionSummary.ProcessedRecords  reduce $$ + $,
			Successful: payload.ExecutionMetrics.BatchExecutionSummary.Successful  reduce $$ + $,
			Total: payload.ExecutionMetrics.BatchExecutionSummary.Total  reduce $$ + $,
			ErrorFile: payload.ExecutionMetrics.BatchExecutionSummary.ErrorFile[0]			
		},
		Status: payload.ExecutionMetrics.Status[0],
		MessagePriority: payload.ExecutionMetrics.MessagePriority[0],
		MessageSummary: payload.ExecutionMetrics.MessageSummary[0],
		MessageDetails: payload.ExecutionMetrics.MessageDetails[0]
	}