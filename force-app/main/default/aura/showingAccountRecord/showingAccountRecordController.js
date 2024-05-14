({
    doinit : function(component, event, helper) {
         var action= component.get("c.methodName");
         action.setCallback(this, function(response){
            var state = response.getState();
            console.log(response.getReturnValue());
            if(state === "SUCCESS"){
                component.set("v.accList",response.getReturnValue());
            }
         });
        $A.enqueueAction(action);
        // var accid = component.get("item.id");
        // console.log(accid);
        

    },
    onChange : function(component, event, helper){
        // var item = event.getSource();
        // console.log(item);
        console.log(component.find("accId").get("v.value"));
    }
})