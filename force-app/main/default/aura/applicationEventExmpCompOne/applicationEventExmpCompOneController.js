({
    sendValue : function(component, event, helper) {
        var appevent = $A.get("e.c:apeEvent");
        appevent.setParams({"parentVar":"Hello I am value from comp1"});
        appevent.fire();

    }
})