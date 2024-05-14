({
    fetchOpp : function(component, event, helper) {
        helper.fetchOppHelper(component, event, helper);
        console.log('inside body controller');
        helper.getPicklistValues(component, event);
        var iconforheadingcl = $A.get("$Label.c.Icon_for_Opportunity");
        component.set("v.iconforheading", iconforheadingcl);
        var headingcl = $A.get("$Label.c.Heading_of_Data_Table");
        component.set("v.heading", headingcl);
        
    },
    handleRowAction : function(component, event, helper) {
        helper.handleRowActionHelper(component, event, helper);
        console.log('inside handle row action');
    },
    updateSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    },
     
    handleNext: function(component, event, helper){        
        component.set("v.currentPageNumber", component.get("v.currentPageNumber") + 1);
        helper.setPaginateData(component);
    },
     
    handlePrevious: function(component, event, helper){
       component.set("v.currentPageNumber", component.get("v.currentPageNumber") - 1);
       helper.setPaginateData(component);
    },
     
    onFirst: function(component, event, helper) {        
        component.set("v.currentPageNumber", 1);
        helper.setPaginateData(component);
    },
     
    onLast: function(component, event, helper) {        
        component.set("v.currentPageNumber", component.get("v.totalPages"));
        helper.setPaginateData(component);
    },
    handleSearch : function(component, event, helper){
        helper.handleSearchHelper(component, event, helper);
    },
    fetchclosed: function(component, event, helper){
        let tab = event.getSource();
        if(tab.get('v.id') == 'one'){
            component.set("v.isclosedvalue",true);
            helper.fetchOppHelper(component, helper, component.get("v.isclosedvalue"));
        }
        else
        {
            component.set("v.isclosedvalue",false);
            helper.fetchOppHelper(component, helper, component.get("v.isclosedvalue"));
        }
    },
    handleClick: function( component, event, helper){
        // Set showNewForm attribute to true
      component.set("v.showNewForm", true);
    },
    closeModel: function( component, event, helper){
        // Set showNewForm attribute to false  
      component.set("v.showNewForm", false);
      component.set("v.showEditForm", false);

    },
    submitDetails: function(component, event, helper) {
        // Set isModalOpen attribute to false
        component.set("v.showNewForm", false);
        helper.submitDetailsHelper(component, event, helper)
     },
     handleOnChange : function(component, event, helper) {
        var industry = component.get("v.opportunity.StageName");
        alert(industry);
    },
    submitEditDetails : function(component, event, helper){

        helper.submitEditDetailsHelper(component, event, helper);
        component.set("v.showEditForm", false);

    }
})