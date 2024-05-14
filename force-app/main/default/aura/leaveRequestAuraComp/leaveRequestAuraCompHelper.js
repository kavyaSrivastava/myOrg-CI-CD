({
    
    fetchAccHelper : function(component, event, helper) {
       
        var action = component.get("c.fetchingAcc");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.acctList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    subscribeHelper : function(component, event, helper){
        const empApi = component.find("empApi");
        const channel = '/event/LWCtoAura__e' ;
        console.log('inside subscribe');
        const replayId = -1;
        const callback = function (message) {
          //  var obj = message.data.payload;
          //  component.set("v.recordId", obj.recordId__c);
            $A.get('e.force:refreshView').fire();
            //helper.fetchAccHelper(component, event, helper);
            console.log('Object details in AURA>>>>>>>>>>>>>');

        };

        empApi.subscribe(channel, replayId, callback).then(function(newSubscription) {
            console.log("Subscribed to channel 1" + channel);
        });

        const errorHandler = function (message) {
            console.error("Received error ", JSON.stringify(message));
        };

        empApi.onError(errorHandler);

        
    },
    // updateAccHelper : function(component, event, helper, recid){
    //     console.log('@@@@@@@@@@@', recid);
    //     var action = component.get("c.updatingRecord");
    //     action.setParams({id : recid});
    //     action.setCallback(this, function(response){
    //         var state = response.getState();
    //         if (state === "SUCCESS") {
    //             console.log('Updated rec succesfully');
    //             helper.fetchAccHelper(component, event, helper);
    //         }
    //         else 
    //         console.log('errr');
    //     });
    //     $A.enqueueAction(action);

    //  }
    updateAccHelper : function(component, event, helper, recid){
        console.log('@@@@@@@@@@@', recid);
        var action = component.get("c.updatingAccRecord");
        action.setParams({id : recid, status : 'Requested'});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('Updated rec succesfully');
                helper.fetchAccHelper(component, event, helper);
                helper.callEvent(component, event, helper,recid );
            }
            else 
            console.log('errr');
        });
        $A.enqueueAction(action);

     },
    //  setCookie: function(cname,cvalue,exdays){
    //     console.log(cname);
    //     console.log(cvalue);
    //     console.log(exdays);
    //     const d = new Date();
    //     d.setTime(d.getTime() + (exdays*24*60*60*1000));
    //     let expires = "expires=" + d.toUTCString();
    //     document.cookie = cname + "=" + cvalue + ";" + expires ;
      
    //  },
       callEvent: function(component, event, helper, recid){
        var action = component.get("c.callingPlatformEvent");
        action.setParams({id : recid, calledFrom : 'Aura'});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('event send succesfully');
               // helper.fetchAccHelper(component, event, helper);
            }
            else 
            console.log('errr');
        });
        $A.enqueueAction(action);
       },
     handleMessageHelper : function(component, message, helper){
        if(message != null && message.getParam("record") != null){
            console.log('message.param =',message.getParam("record"));
            helper.fetchAccHelper(component, event, helper);    

        }
     }
})