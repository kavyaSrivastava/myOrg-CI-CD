import { LightningElement, track } from 'lwc';
import methodName from '@salesforce/apex/Brainstorming2class2.methodName';

export default class Brainstorming2Lwc extends LightningElement {

   
    @track message;
    connectedCallback(){
        
        // this.showToast();
        methodName()
        .then(result=>{
       this.message = result;
       
        })
        .catch(error=>{
         this.message = 'error';
        })
        
     }
     

}