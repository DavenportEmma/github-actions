function Component()
{
}

Component.prototype.createOperations = function()
{
    component.createOperations();
    if (systemInfo.kernelType == "winnt") {
        component.addOperation("Execute",
            "@TargetDir@/Tools/git/cmd/git.exe",
                "config", "--system", "--add",
                "safe.directory", "@TargetDir@/SDK/zephyr/*"
        );
    }
}
