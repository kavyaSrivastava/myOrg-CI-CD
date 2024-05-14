({
    doInit : function(component, event, helper) {
        

       helper.helperMeth(component, event, helper);
    },
    doAction : function(component , event, helper){
        component.set("v.mess", "Completed.");
        var params = event.getParam('arguments');
        console.log(params);
        if (params) {
            var param1 = params.vone;
            var param2 = params.vtwo;
            console.log('=====>', param1, param2);
            alert(param1 + " " + param2);
        }
        // component.set("v.vtwo", "Kavya");
    }
})