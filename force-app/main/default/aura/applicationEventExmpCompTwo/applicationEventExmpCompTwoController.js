({
    getEvents :  function(component, event, helper) {
    var evtValue = event.getParam("parentVar");
    component.set("v.childValue", evtValue);
    }
})