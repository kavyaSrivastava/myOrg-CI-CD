import { LightningElement, track, wire } from 'lwc';
//import { CurrentPageReference } from 'lightning/navigation';
import InsertAcc from '@salesforce/apex/InsertAcc.InsertAcc';
import InsertCon from '@salesforce/apex/InsertAcc.InsertCon';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// import insertAccount from '@salesforce/apex/InsertAcc.InsertAcc';
//import methodName from '@salesforce/apex/TrainingTaskTake2.methodName';


export default class TrainingTask1Take2 extends LightningElement {

     @track objectName;
    @track accountname;
    @track accountid;
    @track websitess;
    @track ddate=null;
    @track ckbx=false;
    @track dattim;
    @track value1;
    @track allValues=[];
    @track contactId;
    @track error;
    @track curntUrl = window.location.href
    @track searchList = new URLSearchParams(this.curntUrl.substring(this.curntUrl.indexOf('?')))
    @track searchVal = this.searchList.get('c__value')
    @track objectName = this.searchList.get('c__objectName')

    // @wire(CurrentPageReference) currentPageReference;
    // connectedCallback(){
    //     if(!this.recursion){
    //         this.navtolwc();
    //         window.history.back();
    //     }

    //   if ( this.currentPageReference.state.c__id) {
    //         this.objectName = this.currentPageReference.state.c__id;
    // }

    connectedCallback(){

        if(this.searchVal=='false'){
            return null;
        }
        else{
            sessionStorage.setItem('previousTab',window.location.href);
            window.open(this.curntUrl , this.searchList.set('c__value', 'false'));
            window.history.back();

            window.onunload = function(){
                var previousTabURl = sessionStorage.getItem('previousTab');
                window.opener.location.reload();
            }
        }
        console.log('Inside connected callback>>>>>>>>>',this.searchVal)
}
  

     handle1(event){
        this.accountname = event.target.value;
     }

     handle2(event){
        this.websitess = event.target.value;
     }

     handle3(event){
      this.ddate = event.target.value;
     }

     handle4(event){
        this.dattim = event.target.value;
     }

     handle5(event){
      this.ckbx=event.target.checked;
      console.log(this.ckbx);
     }

     get options() {
        return [
            
            { label: 'Two', value: 'Two' },
            { label: 'Three', value: 'Three' },
            { label: 'Four', value: 'Four' },
            { label: 'Five', value: 'Five' },
        ];
     }
      handleChange(event) {
        this.value1 = event.target.value;
        console.log(this.value1);
        
     }
     get options1() {
        return[
          { label: 'Food', value: 'Food' },
          { label: 'Ice Skating', value: 'Ice Skating' },
          { label: 'Wall Climbing', value: 'Wall Climbing' },
          { label: 'Haunted House', value: 'Haunted House' },
          { label: 'Fountain Show', value: 'Fountain Show' },
  
        ];  
     }
     get allValuess() {
       return this.allValues.length ? this.allValues : 'none';
      }
   handleChange1(event){
          // if(!this.allValues.includes(event.detail.value)){
              this.allValues = event.detail.value;
             // console.log("Show Proxy object accounts ", JSON.stringify(this.allValues));
         // }
        // console.log("Show Proxy object accounts ", JSON.stringify(this.allValues));
      }
    showToastSuccess() {
        const event = new ShowToastEvent({
              title: 'Hurray!!',
             message: 'Your Record has been created',
                variant: 'success',
                mode: 'dismissible',
               
        });
        this.dispatchEvent(event);
        // setTimeout(function() {
        //     window.history.back();
        //   }, 2000); 
        //window.history.back();
        if(this.objectName==='Account'){
            window.open("https://cloudanalogy225-dev-ed.develop.lightning.force.com/lightning/o/Account/list?filterName=Recent","_self");

        }
        else{
            window.open("https://cloudanalogy225-dev-ed.develop.lightning.force.com/lightning/o/Contact/list?filterName=Recent","_self");

        }

    }
    showToastFail() {
        const event = new ShowToastEvent({
            title: 'Opps!!',
            message:
                'Something went wrong.',
                variant: 'error',
                mode: 'dismissible',

               
        });
        this.dispatchEvent(event);
        window.open("https://cloudanalogy225-dev-ed.develop.lightning.force.com/lightning/o/Account/list?filterName=Recent","_self");

       // window.history.go(-1);
    }
    // navtolwc(){
    //     var defi={
    //         componentDef: 'c:My_Form',
    //         attributes:{
    //             objectName:this.objectName,
    //             recursion:true
    //         }
    //     }
    //     window.open('/one/one.app#' +btoa(JSON.stringify(defi)), '_blank')
    // }
    SaveAccount(){
        //console.log(this.allVaues);
        //console.log(this.objectName)
        if(this.objectName === 'Account'){
            InsertAcc({name :this.accountname, web :this.websitess, dt :this.ddate, c :this.ckbx, dtt :this.dattim, sing :this.value1, selctedoption :this.allValues})
            .then(result =>{
                this.accountid = result.Id;
                this.showToastSuccess();
                console.log(this.accountid);
            }
                )
                .catch(error =>{
                    this.error= error;
                    console.log(error);
                    this.showToastFail();
                })
        }
        else if(this.objectName === 'Contact'){
            InsertCon({name :this.accountname, web :this.websitess, dt :this.ddate, c :this.ckbx, dtt :this.dattim, sing :this.value1, selctedoption :this.allValues })
                .then(result =>{
                    this.contactid = result.Id;
                    this.showToastSuccess();
                    console.log(this.contactid);
                })
                .catch(error =>{
                    this.error = error;
                    console.log(this.error);
                    this.showToastFail();
                })
           }

           //document.getElementById("form1").reset();
            setTimeout("window.close()", 2000);
            



          
        }
        
     }