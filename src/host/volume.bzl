load("//transitions:transitions.bzl","debug_transition")
def _make_volume_impl(ctx):
    # this should print true if indeed the target platform has whatever constraint is
    # is set into the attribute "temp"
    print("Note, platform has ",ctx.attr.temp.label,"?",
        ctx.target_platform_has_constraint(ctx.attr.temp[platform_common.ConstraintValueInfo]))

    output_name = ctx.attr.volume.label.name
    output = ctx.actions.declare_file(output_name)
    builder = ctx.file.builder
    content = ctx.file.content
    ctx.actions.run_shell(
        inputs = [builder,content],
        outputs = [output],
        command = "%s %s %s" % (builder.path, output.path, content.path),
        mnemonic = "makeVolumeBuilder",
        use_default_shell_env = True,
    )
    return [
        DefaultInfo(
            executable = output, 
        ),
    ]

make_volume = rule(
    implementation=_make_volume_impl,
    executable=True,
    attrs = {
        "content": attr.label(
            # has to be built for p1_arm... is this being obeyed?
            # note that you can do cfg = debug_transition for an outgoing
            # transition and it seems to have no change in behavior
            cfg = "target",
            mandatory =True,
            executable = True,
            allow_single_file = True,
        ),
        "builder": attr.label(
            # has to be built for p2_linux_host
            cfg = "exec",
            mandatory = True,
            executable = True,
            allow_single_file = True,
        ),
        "volume": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "temp":attr.label(
            mandatory = True,
            #allow_single_file = True,
        ),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist"
        )
    },
    #this key appears in the ctx.attrs but it's not allowed here?
    #target_compatible_with = "//platforms:p2_linux_host",
    
    # setup a transition so we can see what's going on and maybe change things
    # if you take this attribute out (and the _allowlist above) it seems to not
    # change the behavior
    cfg = debug_transition,
)