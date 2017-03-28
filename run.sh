#!/bin/sh

set -v

# run the pure Go code
go run pure/*.go

# run the cgo Go code
go run cgo/*.go

# explicitly build/run the cgo code
go build -o test ./cgo/
./test

# run with verbose flags passed to the linker
go run -ldflags=-v pure/*.go
go run -ldflags=-v cgo/*.go

# run with verbose flags passed to the linker
go run -ldflags=-s cgo/*.go
