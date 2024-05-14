({
    getProfilePicHelper : function(component, event, helper) {
var action = component.get("c.getProfilePic");
 
action.setCallback(this, function(response){
    var dataOfProfile = response.getReturnValue();
    component.set("v.newMessage", dataOfProfile.SmallPhotoUrl);
    component.set("v.name", dataOfProfile.Name);
        component.set("v.currentUsserPhone", dataOfProfile.Phone);
        console.log(dataOfProfile.Company);
        component.set("v.company", dataOfProfile.CompanyName);
    console.log('result====>' ,dataOfProfile)
})  ;
$A.enqueueAction(action); 

},
 handleClickHelper : function(component, event, helper){
    console.log('Inside helper');
    console.log(component.get("v.isVisible"));
    if(component.get("v.isVisible")=== 'false'){
        component.set("v.isVisible",'true');
        // console.log(component.get("v.isVisible"));

    }
    else{
        component.set("v.isVisible",'false');
    }
    
    // var action = component.get("c.getProfilePic");

    // action.setCallback(this, function(response){
    //     var dataOfProfile = response.getReturnValue();
    //     component.set("v.name", dataOfProfile.Name);
    //     component.set("v.currentUsserPhone", dataOfProfile.Phone);
    //     component.set("v.company", dataOfProfile.Company);
    // })

 }
})