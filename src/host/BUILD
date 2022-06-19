load("//src/host:volume.bzl","make_volume")
package(default_visibility = ["//visibility:public"])

# this program simulates building a tool that can make bootable volumes,
# bios-friendly boot volumes, isos, etc...
cc_binary(
    name="volbuilder",
    srcs = [
        "volbuilder.c"
    ],
    exec_compatible_with=[
        "@platforms//os:linux",
    ],
)

# this program runs on platform p1_linux_host but uses content from p2_arm64
make_volume(
    name="make_volume",
    volume="volume1.txt",
    builder=":volbuilder",
    content="//src/target:myprogram",
    ### this value lets you test the target platform for the presence of that constraint
    ### it is printed in a debug message... it's notable that when this is 
    ### @platforms//os:none the debug print says that in fact the target machine
    ### *does* have that constraint
    temp="@platforms//os:none"
)

