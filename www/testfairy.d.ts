interface TestFairy {
	begin(apiKey: string): void;
	pushFeedbackController(): void;
	checkpoint(name: string): void;
	setCorrelationId(correlationId: string): void;
	pause(): void;
	resume(): void;
}