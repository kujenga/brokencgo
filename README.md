# Broken Cgo on macOS

This repository contains a minimal example of broken behavior I'm experiencing
with Go code compiled with cgo.

- macOS version: `10.12.4`
- Xcode Command Line Tools version: `8.3`

## Output of Failure

Running pure Go code works, but running Go with cgo support fails. The failure
is exhibited as a `9` kill signal.

```
$ go run pure/pure.go
Hello, World!
$ go run cgo/cgo.go
signal: killed
```

Explicitly building/running a binary shows an explicit kill signal.

```
$ go build -o test ./cgo/
$ ./test
Killed: 9
```

I am able to run the program with the `-s` flag passed to through `-ldflags`,
as described in this issue: https://github.com/golang/go/issues/11887

```
$ go run -ldflags='-s' cgo/cgo.go
Hello from stdio

```
