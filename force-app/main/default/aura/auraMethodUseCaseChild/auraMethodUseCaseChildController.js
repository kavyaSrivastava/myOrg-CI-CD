({
    callParentMethod : function(component, event, helper) {
      var parentMeth = component.get("v.parent");
      parentMeth.sampleMethod('Hii','Prerna');
    }
})