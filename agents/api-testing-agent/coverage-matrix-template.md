# API Coverage Matrix Template

Use this table to track coverage for each endpoint and scenario type.

| Resource | Endpoint | Method | Scenario Type | Scenario | Priority | Status (Planned/Executed/Passed/Failed/Blocked) | Notes |
|----------|----------|--------|---------------|----------|----------|--------------------------------------------------|-------|
| users | /users | GET | Happy Path | List users returns 200 with expected schema | High | Planned | |
| users | /users | GET | Negative | Invalid query parameter returns 400 | Medium | Planned | |
| users | /users/{id} | GET | Auth | Missing token returns 401 | High | Planned | |
| users | /users/{id} | GET | Boundary | Non-existent ID returns 404 | High | Planned | |
| users | /users | POST | Security | SQL injection string in name rejected | High | Planned | |
| users | /users | POST | Reliability | Retry on transient 5xx is successful | Medium | Planned | |

## Coverage formulas

- Endpoint coverage % = endpoints with at least one executed test / total endpoints
- Scenario coverage % = executed scenarios / total planned scenarios
- Pass rate % = passed scenarios / executed scenarios
