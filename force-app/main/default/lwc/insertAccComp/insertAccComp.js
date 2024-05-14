import { LightningElement, track } from 'lwc';
import InsertAcc from '@salesforce/apex/InsertAcc.InsertAcc'
export default class InsertAccComp extends LightningElement {
    //firstname = document.getElementsByI('Name');
    @track accountname;
    @track accountid;
    @track websitess;
    @track ddate;
    @track ckbx=false;
    @track dattim;
    @track value1;
    handle1(event){
        this.accountname = event.target.value;
    }
    handle2(event){
        this.websitess = event.target.value;
    }
    handle3(event){
      this.ddate = event.target.value;
    }
    handle5(event){
    this.ckbx=event.target.checked;
 
    console.log(this.ckbx);
    }
    handle4(event){
        this.dattim = event.target.value;
    }
    get options() {
        return [
            { label: 'New', value: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }
    handleChange(event) {
        this.value1 = event.target.value;
        console.log(this.value1);
        
    }
    get options1() {
      return[
        { label: 'New', value: 'new' },
        { label: 'In Progress', value: 'inProgress' },
        { label: 'Finished', value: 'finished' },

      ];  

    }

 @track allValues=[];

 get allValuess() {
    return this.allValues.length ? this.allValues : 'none';
 }

 
handleChange1(event){
        // if(!this.allValues.includes(event.detail.value)){
            this.allValues = event.detail.value;
           
        // }
    }
     jsonString = JSON.stringify(this.allValues);
   
    handleClick(){
       console.log(this.allVaues);
       JSON.stringify(this.allValues);
        JSON.stringify(this.ckbx);
        InsertAcc({name :this.accountname, web :this.websitess, dt :this.ddate, c :this.ckbx, dtt :this.dattim, sing :this.value1, selectedOptions : this.allValues})
        .then(result =>{
            this.accountid = result.Id;
        }
            )
            .catch(error =>{
                this.error= error;
            })
    }  
}