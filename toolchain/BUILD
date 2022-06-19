load("//toolchain:toolchain_info.bzl", 
    "cc_toolchain_config_t1_arm64",
    "cc_toolchain_config_t2_linux_host")
package(default_visibility = ["//visibility:public"])

filegroup(name = "empty")

toolchain(
    name = "t1_arm64",
    ## note that this is the TARGET but //src/target:myprogram says that it
    ## is *exec* compatible with these constraints.  Changing this and uncommenting
    ## the exec_compatible_with parameter below seems to have no effect.
    target_compatible_with = [
        "@platforms//os:none",
        "@platforms//cpu:arm64",
    ],
    exec_compatible_with = [
        "@platforms//os:linux",
    ],
    #
    # changing to this toolchain name has no effect
    # toolchain = "//toolchain:t1", ??
    toolchain = "//toolchain:t1_arm64_cc",
    toolchain_type="@bazel_tools//tools/cpp:toolchain_type",
)

toolchain(
    name = "t2_linux_host",
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    exec_compatible_with = [
        "@platforms//os:linux",
    ],
    # changing to this toolchain name has no effect
    #toolchain = "//toolchain:t2",
    toolchain = "//toolchain:t2_linux_host_cc",
    toolchain_type="@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain(
    name = "t1_arm64_cc",
    toolchain_identifier = "t1",
    toolchain_config = ":t1_arm64_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    #supports_param_files = 0,
    exec_transition_for_inputs=False
)

cc_toolchain(
    name = "t2_linux_host_cc",
    toolchain_identifier = "t2",
    toolchain_config = ":t2_linux_host_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    # supports_param_files = 0,
    # exec_transition_for_inputs=True
)

cc_toolchain_config_t1_arm64(
    name = "t1_arm64_config",
)

cc_toolchain_config_t2_linux_host(
    name = "t2_linux_host_config",
)
