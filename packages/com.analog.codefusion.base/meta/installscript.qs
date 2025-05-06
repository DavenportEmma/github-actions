function Component()
{
}

Component.prototype.createOperations = function()
{
    component.createOperations();

    if (installer.value("os") === "win") {
        component.addOperation(
            "CreateShortcut",
            "http://developer.analog.com/docs/codefusion-studio/1.1.1/",
            "@StartMenuDir@/CodeFusion Studio User Guide.url"
        );
    }
}
