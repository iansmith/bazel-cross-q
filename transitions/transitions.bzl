def _debug_transition_impl(settings, attr):
    for s in settings:
        print("debug transition: setting: ",s, ":",settings[s])
    if len(attr.exec_compatible_with)==0:
        print("debug transition: attr.exec_compatible_with: No Constraints")
    else:
        print("debug transition: attr.exec_compatible_with: ",attr.exec_compatible_with)
    if len(attr.target_compatible_with)==0:
        print("debug transition: attr.target_compatible_with: No Constraints")
    else:
        print("debug transition: attr.target_compatible_with: ",attr.target_compatible_with)
    #if you use the next line and try to say the platform is linux host, then you get
    #//src/target:myprogram   <-- target platform (//platforms:p2_linux_host) didn't satisfy constraints [@platforms//os:none, @platforms//cpu:arm64]
    #but returning the "correct" platform seems to have no impact since the
    #command line flage "--platforms" already has this value
    return {"//command_line_option:platforms": "//platforms:p1_arm64"}

debug_transition = transition(
    implementation = _debug_transition_impl,
    inputs=["//command_line_option:platforms"],
    outputs=["//command_line_option:platforms"],
)