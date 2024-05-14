({
    doInit : function(component, event, helper) {
        helper.doInitHelper(component, helper, event);
        var namecustoml = $A.get("$Label.c.For_Profile_detail");
        var phonecustoml = $A.get("$Label.c.For_Profile_detail_Phone");
        var companycustoml = $A.get("$Label.c.For_Profile_detail_Company");
        var countrycustoml = $A.get("$Label.c.For_Profile_detail_Country");
        var headingcustoml = $A.get("$Label.c.For_Profile_heading")
        
        component.set("v.Name1", namecustoml);
        component.set("v.Phone1", phonecustoml);
        component.set("v.Company1", companycustoml);
        component.set("v.Country1", countrycustoml);
        component.set("v.heading", headingcustoml);

    },
    handleClick : function(component, event, helper){
        component.set("v.showModal", true);
        // helper.handleClickHelper(component, event, helper);
    },
    closeModel: function( component, event, helper){
        // Set showNewForm attribute to false  
      component.set("v.showModal", false);
    },
    submitDetails: function(component, event, helper) {
        // Set isModalOpen attribute to false
        component.set("v.showModal", "false");
        helper.submitDetailsHelper(component, event, helper)
     },
})