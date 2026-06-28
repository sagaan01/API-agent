# API Testing Agent

This agent is designed to test any HTTP API and maximize functional, negative, and non-functional coverage.

## What this agent covers

1. **Contract validation**
   - Endpoint exists and matches specification.
   - Request/response schema validation.
   - Required/optional field behavior.

2. **Happy-path functional tests**
   - Create, read, update, delete lifecycle checks where applicable.
   - Filtering, pagination, sorting, and search behavior.
   - Idempotency behavior for safe and unsafe methods.

3. **Negative and edge-case tests**
   - Invalid payload shape and data type mismatches.
   - Missing required fields and malformed JSON.
   - Unauthorized/forbidden access checks.
   - Not-found and conflict scenarios.
   - Boundary values (min/max lengths, limits, empty values).

4. **Reliability and resilience tests**
   - Retry handling and transient failure scenarios.
   - Rate limiting behavior (429 and backoff expectations).
   - Timeout and partial failure handling.

5. **Security-focused API checks**
   - Auth token validation and expiration behavior.
   - Injection payload rejection and input sanitization.
   - Sensitive data leakage prevention in responses/errors/logs.
   - Role-based access control path checks.

6. **Performance smoke checks**
   - Basic latency thresholds for key endpoints.
   - Error-rate thresholds under lightweight concurrency.

## How to use

1. Provide:
   - Base URL
   - Authentication details (if required)
   - API spec (OpenAPI/Postman collection, if available)
   - Environment details (dev/stage/prod-like)
2. Run the test workflow described in `agent-prompt.md`.
3. Export:
   - Coverage matrix
   - Pass/fail results
   - Defect list with reproduction steps

## Deliverables

- Endpoint coverage report
- Scenario coverage report
- Security and resilience findings
- Prioritized defect summary

## Example open API execution

A completed sample run against a public OpenAPI service is available in:

- `agents/api-testing-agent/examples/fakerest-openapi-test-report.md`
- `agents/api-testing-agent/examples/fakerest-coverage-matrix.md`
