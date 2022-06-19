package(default_visibility = ["//visibility:public"])

# this program would be WHAT IS PUT IN the newly created bootable image, iso, etc
# must be built for target
cc_binary(
    name="myprogram",
    srcs = [
        "myprogram.c"
    ],
    ## if you change this to "exec_compatible_with" you receive
    ## ERROR: /workspaces/parigot/tmp/bazel-cross-q/src/target/BUILD:5:10: While resolving toolchains for target //src/target:myprogram: No matching toolchains found for types @bazel_tools//tools/cpp:toolchain_type.
    ## which seems ok, because the attribute describes the _toolchain_ not the target
    target_compatible_with=[
        "@platforms//os:none",
        "@platforms//cpu:arm64",
    ],
)
