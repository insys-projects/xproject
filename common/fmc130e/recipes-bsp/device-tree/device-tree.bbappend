SRC_URI_append ="\
    file://system-user.dtsi \
    file://zdev.dtsi \
    file://axidev.dtsi \
    file://fmc130e.dtsi \
"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
