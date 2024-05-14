({
   
    fetchAcc : function(component, event, helper) {
       
        var actions = [
            { label: 'Send for approval', name: 'Requested' }
          
        ];
        component.set('v.mycolumns', [
        {label: 'Account Name', fieldName: 'Name', type: 'text'},
        {label: 'Status', fieldName: 'Approval_Status__c', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
            {label: 'Website', fieldName: 'Website', type: 'url '},
            {type:  'action',typeAttributes:{rowActions:actions}}
        ]);
        helper.fetchAccHelper(component, event, helper);
        helper.subscribeHelper(component,event, helper);
        // var channel = "/event/LWCtoAura__e";
        // const replayId = -1;
          
        // const empApi = component.find("empApi");

        // const callback = function(message) {
        //     var obj = message.data.payload;
        //     console.log("++++++++++++");
        //     console.log(obj.RecId__c);
        //     console.log("++++++++++++");
        //    helper.fetchAccHelper(component, event, helper);
        //   // $A.get('e.force:refreshView').fire();
        // };
        //     empApi.subscribe(channel, replayId, callback).then(function(newSubscription) {
        //     // console.log("Subscribed to channel 1" + channel);
        //     // console.log('newSubscription=====', message);
        // });
        // const errorHandler = function (message) {
        //     console.error("Received error ", JSON.stringify(message));
        // };

        // empApi.onError(errorHandler);

        // var channel = '/event/LWCtoAura__e';
        // const replayId = -1;
        // const empApi = component.find("empApi");
        // console.log('lwcHandler called>>>>>>>>>')
        // const callback = function (message) {
        //     var obj = message.data.payload;
        //   //  component.set("v.recordId", obj.recordId__c);
        //     $A.get('e.force:refreshView').fire();
        //     // helper.getAccounts(component, helper)
        //     console.log('Object details in AURA>>>>>>>>>>>>>',obj.RecId__c);

        // };

        // empApi.subscribe(channel, replayId, callback).then(function(newSubscription) {
        //     console.log("Subscribed to channel 1" + channel);
        // });

        // const errorHandler = function (message) {
        //     console.error("Received error ", JSON.stringify(message));
        // };

        // empApi.onError(errorHandler);

       
    //=================DOCUMENT CODE==========================================================================
        // empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
        //     // Process event (this is called each time we receive an event)
        //     console.log('Received event ', JSON.stringify(eventReceived));
        // }))
        // .then(subscription => {
        //     // Subscription response received.
        //     // We haven't received an event yet.
        //     console.log('Subscription request sent to: ', subscription.channel);
        //     // Save subscription to unsubscribe later
        //     component.set('v.subscription', subscription);
        // });


    },
    handleRowAction: function(component, event, helper) {
        
        var action = event.getParam('action').name;
        let recId = event.getParam('row').Id;
        console.log('inhandle Action');
        helper.updateAccHelper(component, event, helper, recId);
        console.log('inhandle2')
        // var payload = {'record': recId};
        // component.find('countingUpdateId').publish(payload);
        // helper.setCookie("recordId", recId, 1);
       

    },
   
    // handleMessage: function(component, message, helper){
    //     console.log('Is message from LWC', message)
    //     helper.handleMessageHelper(component, message, helper);
    // }
    
})