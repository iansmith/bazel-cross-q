load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "tool_path",
)
def _t1_impl(ctx):
    ## for learning/testing, the particular path to this tool doesn't matter,
    ## you just want to see bazel call whatever is here as "gcc" to build myprogram.c
    base = "/usr/bin/aarch64-linux-gnu-" 
    tool_paths = [ 
        tool_path(
            name = "gcc",
            path = base + "gcc-12",
        ),
    ]
    return cc_common.create_cc_toolchain_config_info(
        # note: I tried to configure the action specifically and it did not change the behavior.
        # action_configs = [
        #     action_config(
        #         action_name = ACTION_NAMES.C_COMPILE_ACTION_NAME,
        #         tools = [
        #             tool(
        #                 path = base+"gcc-12",
        #                 with_features = [],
        #             ),
        #         ],
        #         enabled = True,
        #     ),
        # ],    

        ctx = ctx,
        toolchain_identifier = "t1",        
        host_system_name = "ignored",
        target_system_name = "arm64-none-none",
        target_cpu = "arm64",
        target_libc = "none",
        compiler = base + "gcc-12" ,
        tool_paths = tool_paths,
    )

cc_toolchain_config_t1_arm64 = rule(
    implementation = _t1_impl,
    provides = [CcToolchainConfigInfo],
)


def _t2_impl(ctx):
    tool_paths = [ 
        tool_path(
            name = "gcc",
            path = "/usr/bin/gcc",
        ),
    ]
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "t2",
        host_system_name = "ignored",
        target_system_name = "x86_64_linux_gnu",
        target_cpu = "x86_64",
        target_libc = "unknown",
        compiler = "gcc",
        tool_paths = tool_paths,
    )

cc_toolchain_config_t2_linux_host = rule(
    implementation = _t2_impl,
    provides = [CcToolchainConfigInfo],
)
