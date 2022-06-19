# bazel-cross-q
bazel example of trying to build a bootable volume (on host) that contains compiled code from the target machine

The build command I've been testing with:

```
bazel run -s --toolchain_resolution_debug=@bazel_tools//tools/cpp:toolchain_type  --verbose_failures --sandbox_debug  --platforms=//platforms:p1_arm64 //src/host:make_volume
```
