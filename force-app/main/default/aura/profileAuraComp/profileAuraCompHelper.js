({
    doInitHelper: function (component, helper, event) {
        var action = component.get("c.getProfilePic");

        action.setCallback(this, function (response) {
            var dataOfProfile = response.getReturnValue();
            component.set("v.photo", dataOfProfile.SmallPhotoUrl);
            component.set("v.name", dataOfProfile.Name);
            component.set("v.currentUsserPhone", dataOfProfile.Phone);
            console.log(dataOfProfile.Company);
            component.set("v.company", dataOfProfile.CompanyName);
            component.set("v.country", dataOfProfile.Country);
            component.set("v.currentusermail", dataOfProfile.Email);



            console.log('result====>', dataOfProfile)
        });
        $A.enqueueAction(action);

    },
    submitDetailsHelper: function (component, helper, event) {
        var nameNew = component.get("v.name");
        var phoneNew = component.get("v.currentUsserPhone");
        var companyNew = component.get("v.company");
        var countryNew = component.get("v.country");

        var action = component.get("c.insertUser");
        action.setParams({
            p: phoneNew,
            countryn: countryNew,
            companyn: companyNew,

        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('Record Created Successfully!!');
            } else if (state === "ERROR") {
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            }
        });
        $A.enqueueAction(action);
    },
})