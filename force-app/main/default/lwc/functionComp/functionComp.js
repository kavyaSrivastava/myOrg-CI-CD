import { LightningElement, track, wire } from 'lwc';
import getAcc2 from '@salesforce/apex/MyClass22.getAcc2';
export default class FunctionComp extends LightningElement {
    @track searchkey;
    @track account;
    @track error;

    @wire(getAcc2,{text:"$searchkey"})
    wiredAccounts(data,error){
        if(data){
            this.account = data;
            this.error = undefined;

        }
        else{
            this.error= error;
            this.account = undefined;
        }
    }
    handleKeyChange(event){
        this.searchkey = event.target.value;

    }
}