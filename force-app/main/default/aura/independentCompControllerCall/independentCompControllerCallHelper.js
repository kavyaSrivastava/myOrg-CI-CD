({
    helperMethod1 : function(component, event, helper) {
// do domething
    // component.auraMeth();
    helper.helperMethod2();
    console.log("in helper method 1");
    },
    helperMethod2 : function(component, event, helper){
        console.log("in helper method 2");
        component.auraMeth();
    }
})