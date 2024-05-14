({
    doInit : function(component, event, helper) {
       helper.getProfilePicHelper(component, event, helper);

    },
    handleImageClick : function(component, event, helper){
        window.open('https://www.cloudanalogy.com','_blank');
    },
    handleClick : function(component, event, helper){
        console.log('Inside controller');
        helper.handleClickHelper(component, event, helper);
    }
})