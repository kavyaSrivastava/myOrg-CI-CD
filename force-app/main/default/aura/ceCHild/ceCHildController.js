({
    childComponentEvent : function(component, event, helper) {
        var message = event.getParam("message"); 
        //Set the handler attributes based on event data 
        cmp.set("v.var1", message.message ); 
    }
})