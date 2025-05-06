function Component()
{
}

Component.prototype.createOperations = function()
{
    component.createOperations();
    if (systemInfo.kernelType == "winnt") {
        component.addOperation("Execute",
            "@TargetDir@/Tools/git/usr/bin/bash.exe", "-c",
            "for d in $(/usr/bin/find '@TargetDir@'/SDK/zephyr -type d -name .git); do " +
                "( " +
                     "cd $d/.. && " +
                     "'@TargetDir@'/Tools/git/cmd/git config core.filemode false && " +
                     "'@TargetDir@'/Tools/git/cmd/git config core.ignorecase true && " +
                     "'@TargetDir@'/Tools/git/cmd/git restore --staged --worktree ." +
                ") " +
            "done"
        );
    } else {
        component.addOperation("Execute",
            "/bin/bash", "-c",
            "for d in $(/usr/bin/find '@TargetDir@'/SDK/zephyr -type d -name .git); do " +
                "( cd $d/.. && '@TargetDir@'/Tools/git/bin/git restore --staged --worktree .) " +
            "done"
        );
    }
}
