# parking.proto

[![ci](https://github.com/nalrematvonesah/parking.proto/actions/workflows/ci.yml/badge.svg)](https://github.com/nalrematvonesah/parking.proto/actions/workflows/ci.yml)
[![Go Reference](https://pkg.go.dev/badge/github.com/nalrematvonesah/parking.proto.svg)](https://pkg.go.dev/github.com/nalrematvonesah/parking.proto)

Protocol Buffers definitions for the **Parking** service of the Smart Parking
System.

## Layout

```
proto/parking/v1/parking.proto   # service contract
gen/parking/v1/                  # generated Go code
scripts/generate.sh              # regenerate Go code
buf.yaml                         # buf lint config
.github/workflows/ci.yml         # lint + generate + build on every push/PR
.github/workflows/release.yml    # GitHub Release on every v* tag
```

## Local development

Required tools: `protoc`, `protoc-gen-go`, `protoc-gen-go-grpc`, `buf`, `go 1.25+`.

```bash
# install plugins once
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
export PATH="$PATH:$(go env GOPATH)/bin"

# lint
buf lint

# generate
./scripts/generate.sh

# commit the regenerated files in gen/ together with .proto changes
```

CI will refuse a PR where `gen/` is out of sync with `.proto`.

## Use from a Go service

```bash
go get github.com/nalrematvonesah/parking.proto@latest
```

```go
import parkingv1 "github.com/nalrematvonesah/parking.proto/gen/parking/v1"
```

## Releasing

```bash
git tag v0.1.0
git push origin v0.1.0
# release.yml will create a GitHub Release automatically
```
