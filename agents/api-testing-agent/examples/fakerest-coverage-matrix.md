# FakeRest API Coverage Matrix (Completed Example)

| Resource | Endpoint | Method | Scenario Type | Scenario | Priority | Status | Notes |
|----------|----------|--------|---------------|----------|----------|--------|-------|
| books | /Books | GET | Happy Path | List books returns 200 with expected schema fields | High | Passed | Response contained array objects with expected keys |
| books | /Books | POST | Happy Path | Create book with valid payload | High | Passed | Returned 200 with created payload |
| books | /Books/{id} | GET | Happy Path | Fetch created book by ID | High | Failed | Returned 404 after successful create |
| books | /Books/{id} | PUT | Happy Path | Update book fields by ID | Medium | Passed | Returned 200 with updated payload |
| books | /Books/{id} | DELETE | Boundary | Delete existing test ID | Medium | Passed | Returned 200 |
| books | /Books/{id} | GET | Boundary | Fetch deleted ID returns 404 | Medium | Passed | Returned 404 |
| books | /Books/{id} | GET | Negative | Non-numeric ID returns validation error | High | Passed | Returned 400 with `errors.id` details |
| books | /Books | POST | Negative | Invalid JSON type for `id` rejected | High | Passed | Returned 400 with type-conversion error |
| books | /Books | GET | Auth | Request with fake bearer token | Low | Passed | Returned 200 (public endpoint behavior) |

## Coverage formulas (this run)

- Endpoint coverage % = 3/3 = **100%** for tested resource endpoints (`/Books`, `/Books/{id}` with CRUD)
- Scenario coverage % = 9/9 = **100%**
- Pass rate % = 7/9 = **77.8%**
