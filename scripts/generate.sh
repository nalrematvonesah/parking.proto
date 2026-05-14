#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

protoc \
  --proto_path=proto \
  --go_out=. \
  --go_opt=module=github.com/nalrematvonesah/parking.proto \
  --go-grpc_out=. \
  --go-grpc_opt=module=github.com/nalrematvonesah/parking.proto \
  proto/parking/v1/parking.proto

echo "generated parking.proto code"
