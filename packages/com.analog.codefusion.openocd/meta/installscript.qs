function Component()
{
}

Component.prototype.createOperations = function()
{
    component.createOperations();
    if (systemInfo.kernelType == "linux") {
        component.addOperation("Execute", "/bin/bash",
            "@TargetDir@/Tools/openocd/share/openocd/scripts/setup_usb_permissions.sh");
    }
}
