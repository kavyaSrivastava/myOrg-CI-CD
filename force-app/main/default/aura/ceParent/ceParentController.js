({
    parentComponentEvent : function(component, event, helper) {
        console.log("clicked");
        var cmpEvent = component.getEvent("parent"); 
        //Set event attribute value
        cmpEvent.setParams({"message" : "Welcome"}); 
        cmpEvent.fire();
    }
})