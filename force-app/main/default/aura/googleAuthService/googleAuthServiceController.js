({
    doInit: function (component, event, helper) {
        let url = window.location.href;
        function getParameterByName(name, url) {
            console.log('====name===', JSON.stringify(name));
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, '\\$&');
            console.log('====name====', name);
            let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
            console.log('====name====', JSON.stringify(name));
            console.log('====code====', JSON.stringify(url));
            console.log('===results==', JSON.stringify(results));
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
        let code = getParameterByName('code');
        console.log('====code====', JSON.stringify(code));


        if (code !== undefined && code !== '' && code !== null) {
            console.log("Inside controller");
            let action = component.get('c.getAccessToken');
            action.setParams({
                'code': code
            });
            action.setCallback(this, function (response) {
                let status = response.getState();
                if (status === "SUCCESS") {
                    let accessToken = response.getReturnValue();
                    component.set("v.isAllowed", 'true');
                    component.set("v.accessToken", accessToken);
                    component.set("v.access", accessToken == true ? 'Authenticated..' : 'Not Authenticated..');
                }
            });
            //console.log('*******************************');
            $A.enqueueAction(action);
        }
    },
    doAuth: function (component, event, helper) {
        let action = component.get("c.createAuthURL");
        action.setCallback(this, function (response) {
            let status = response.getState();
            let authUrl = response.getReturnValue();
            if (status === "SUCCESS" && authUrl !== null ) {
                window.location.href = authUrl
                //window.location.href = response.getReturnValue();
            }
        });
        $A.enqueueAction(action);
    },
    handleFilesChange: function (component, event, helper) {
        //helper.fileChangeHelper(component, event, helper);
        helper.fileChangeHelperTwo(component, helper, event);
    },
    handleClick: function (component, event, helper) {
        component.set("v.showSpinner", true);
        helper.handleCLickHelper(component, event, helper);
    },
    handleBackClick: function (component, event, helper) {
        window.history.go(-1);
    },
    handleUploadFinished: function(component, event, helper){
        console.log('$$$$$$$$$$$$$$$$$$$$$$$$$$$');
       // helper.handleUploadFinishedhelper(component, event, helper);
        helper.handlechunkedFile(component, event, helper);
    }
})