Install

`make cli-install` {{execute}}

will build and install the new example plugin into `$GOPATH/bin`. Assuming that is in your `$PATH`, the following should now be possible.

```bash
k example version
Example Version: version.Info{GitVersion:"0.1.0", GitCommit:"64e04046", BuildDate:"2020-01-30T22:00:17Z", GoVersion:"go1.13.7", Compiler:"gc", Platform:"darwin/amd64"}
```
