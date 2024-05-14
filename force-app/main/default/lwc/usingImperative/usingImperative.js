import { LightningElement, track } from 'lwc';
import  getAcc2 from '@salesforce/apex/MyClass22.getAcc2';


export default class UsingImperative extends LightningElement {
    @track account;
    @track error;
    
  
    handleKeyChange(event){
        const searchkey = event.target.value;
        getAcc2({text: searchkey})
        .then(result => {
            this.account = result
            this.error = undefined;

        })
        .catch(error =>{
            this.error = error;
            this.account = undefined;
        })
        

    }
}