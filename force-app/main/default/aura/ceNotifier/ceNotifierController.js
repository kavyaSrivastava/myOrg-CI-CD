({
    fireComponentEvent : function(cmp, event, helper) {
        var cmpEvent = cmp.getEvent("cmpEvent");
        cmpEvent.setParams({
            "message": "A component event fired me. " + " It all happened so fast. Now, I'm here!"
        });
        cmpEvent.fire();

    }
})