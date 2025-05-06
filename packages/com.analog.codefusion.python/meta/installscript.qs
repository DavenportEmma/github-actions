function Component()
{
}

Component.prototype.createOperations = function()
{
    component.createOperations();
    if (systemInfo.kernelType == "winnt") {
        component.addOperation("Execute",
            "@TargetDir@/Tools/git/usr/bin/sh.exe",
            "-c",
            "/bin/sed -bi 's;C:\\\\\\\\opt\\\\\\\\python\\\\\\\\;@TargetDir@/Tools/python/;' " +
                          "'@TargetDir@'/Tools/python/Scripts/*.{exe,py}"
        );
    } else if (systemInfo.kernelType == "darwin") {
        component.addOperation("Execute",
            "/bin/sh", "-c",
            "/usr/bin/find '@TargetDir@'/Tools/python/bin -type f | " +
              "LC_CTYPE=C /usr/bin/xargs /usr/bin/sed -i '' '1s;^#!/opt/;#!@TargetDir@/Tools/;'"
        );
    } else if (systemInfo.kernelType == "linux") {
        component.addOperation("Execute",
            "/bin/sh", "-c",
            "/usr/bin/find '@TargetDir@'/Tools/python/bin -type f | " +
              "LC_CTYPE=C /usr/bin/xargs /usr/bin/sed -i '1s;^#!/opt/;#!@TargetDir@/Tools/;'"
        );
    }
}
