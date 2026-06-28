#!/usr/bin/env bash
set -euo pipefail

BOOK_ID="${BOOK_ID:-987654321}"
BASE_URL="${BASE_URL:-https://fakerestapi.azurewebsites.net/api/v1}"

echo "Running API testing agent smoke checks against: $BASE_URL"
echo "BOOK_ID=$BOOK_ID"

run() {
  local name="$1"
  local method="$2"
  local url="$3"
  local data="${4:-}"
  local content_type="${5:-application/json}"

  if [[ -n "$data" ]]; then
    code=$(curl -sS -o /tmp/"$name".json -w "%{http_code}" -X "$method" "$url" -H "Content-Type: $content_type" -d "$data")
  else
    code=$(curl -sS -o /tmp/"$name".json -w "%{http_code}" -X "$method" "$url")
  fi

  echo "$name -> HTTP $code"
}

run "get_books" "GET" "$BASE_URL/Books"
run "create_book" "POST" "$BASE_URL/Books" "{\"id\":$BOOK_ID,\"title\":\"Cursor API Agent Book\",\"description\":\"created by automated test\",\"pageCount\":123,\"excerpt\":\"sample excerpt\",\"publishDate\":\"2026-06-28T00:00:00.000Z\"}"
run "get_book" "GET" "$BASE_URL/Books/$BOOK_ID"
run "update_book" "PUT" "$BASE_URL/Books/$BOOK_ID" "{\"id\":$BOOK_ID,\"title\":\"Cursor API Agent Book Updated\",\"description\":\"updated by automated test\",\"pageCount\":456,\"excerpt\":\"updated excerpt\",\"publishDate\":\"2026-06-28T00:00:00.000Z\"}"
run "delete_book" "DELETE" "$BASE_URL/Books/$BOOK_ID"
run "get_deleted_book" "GET" "$BASE_URL/Books/$BOOK_ID"
run "get_invalid_id" "GET" "$BASE_URL/Books/not-a-number"
run "create_bad_payload" "POST" "$BASE_URL/Books" "{\"id\":\"bad\",\"title\":123}"

echo "Done. Response bodies are in /tmp/*.json"
