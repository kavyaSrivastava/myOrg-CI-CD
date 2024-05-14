import { LightningElement ,wire, api} from 'lwc';
import fetchingAcc from '@salesforce/apex/FetchAccounts.fetchingAccWithStatus';
import updatingAccRecord from '@salesforce/apex/FetchAccounts.updatingAccRecord';
import callEvent from '@salesforce/apex/FetchAccounts.callingPlatformEvent';
//import {APPLICATION_SCOPE, MessageContext, publish, subscribe, unsubscribe, createMessageContext, releaseMessageContext} from 'lightning/messageService';
import {subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';
//import msgChannel from "@salesforce/messageChannel/Counting_Update__c"

const actions = [
    { label: 'Approve', name: 'Approved' },
    { label: 'Reject', name: 'Rejected' }
];

export default class LeaveRequestComp extends LightningElement {
    data=[];
    columns=[ 
        {label: 'Account Name', fieldName: 'Name', type: 'text'},
        {label: 'Status', fieldName: 'Approval_Status__c', type: 'text'},
        {label: 'Industry', fieldName: 'Industry', type: 'text'},
        {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
        {label: 'Website', fieldName: 'Website', type: 'url '},
        { label: '   Action      ',
        type: 'action',
        initialWidth:'100px',
        typeAttributes: { rowActions: actions},
        },
    ];
    @api channelName = '/event/AuraToLWC__e';
    IdOfRecord='';
    subscription = {};
    connectedCallback(){
        fetchingAcc()
        .then(result=>{
           // console.log('Get request made successfully>>>>>>',result)
            //const a = JSON.stringify(result);
            this.data = result;
            //this.data.push(obj);
            //console.log('After inserting the results in data>>>>>>>>>>>>>>.', this.data)
        })
        .catch(error=>{
            console.log('Error while making get request>>>>>>')
            console.log(error)
        })
        console.log("###########");

        //this.subscribeToMessageChannel();
       // this.registerErrorListener();
        this.handleSubscribe();
    
    }  

    subscription = null;
   
   // ---------FOR LMS--------------------------------------------------------------------------------------------------------
  //  @wire(MessageContext) messageContext;

    // subscribeToMessageChannel() {
    //     console.log('Inside subscribe method');
    //     this.subscription = subscribe(
    //       this.messageContext,
    //       msgChannel,
    //       (message) => this.handleMessage(message)
    //     );
    // }

    // handleMessage(message) {
    //     if(message !== null) {
    //         console.log('message in lwc',message);
    //         this.gettingAllRecordsToUpdate();
    //     }
    // }

    handleSubscribe() {
        // Callback invoked whenever a new event message is received
        const self = this;
        const messageCallback = function (response) {
            console.log('New message received 1: ', JSON.stringify(response));
            console.log('New message received 2: ', response);
            var obj = JSON.parse(JSON.stringify(response));
            console.log('payload', obj.data.payload);
            console.log('recId sub', obj.data.payload.RecId__c);
            console.log('channel sub', self.channelName);
            self.gettingAllRecordsToUpdate();
         };
 
        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then(response => {
            // Response contains the subscription information on subscribe call
            console.log('Subscription request sent to: ', JSON.stringify(response.channel));
            this.subscription = response;
            
            
        });
    }
    registerErrorListener() {
        onError(error => {
            console.log('Received error from server: ', JSON.stringify(error));
        });
    }

   gettingAllRecordsToUpdate(){
    console.log('changing the updte meth');
    fetchingAcc()
        .then(result=>{
            console.log('changing the updte meth');
            this.data = result;
            console.log('changing the updte meth');
        })
        .catch(error=>{
            console.log('Error while making get request>>>>>>')
            console.log(error)
        })
   }

   handleRowAction( event){
    
    const actionName = event.detail.action.name;
    const row = event.detail.row;
    this.IdOfRecord =row.Id;
    console.log('Action Name>>>>>>>>>', actionName);
    console.log('ROW>>>>>>>>>', this.IdOfRecord);
    updatingAccRecord({id : row.Id, status: actionName})
    
    .then(result=>{
      console.log('success');
      
      this.callEventMeth();
    //   const payload = {'record': row.Id};
    //   console.log(this.messageContext);
    //   console.log(JSON.stringify(payload));
      //publish(this.messageContext, msgChannel, payload);

    })
   .catch(error=>{
    console.log('errrr');
   })
   
    

   }
   callEventMeth(){
    console.log('IdOfApproved Record');
    callEvent({ id: this.IdOfRecord, calledFrom: 'LWC'})
        .then(response=>{

            this.gettingAllRecordsToUpdate();
            console.log('inside call event method',response);

        })
        .catch(error=>{
            console.log('inside callEventMeth error');
        })
    

   }
}