({
    init: function(component, event, helper) {
        component.set("v.valueB", component.getReference("v.valueA"));
        component.set("v.valueC", component.get("v.valueA"));
    }
})