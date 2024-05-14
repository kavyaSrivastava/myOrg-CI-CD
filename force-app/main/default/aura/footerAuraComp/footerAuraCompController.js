({
    doInit : function(component, event, helper) {
        var homePageNewslabel = $A.get("$Label.c.Footer_Value_For_Task_2");
        component.set("v.homePageNews", homePageNewslabel);
    }
})