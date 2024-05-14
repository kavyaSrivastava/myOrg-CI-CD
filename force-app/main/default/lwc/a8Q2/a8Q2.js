import { LightningElement, track } from 'lwc';
import methodName from '@salesforce/apex/A8Q2.methodName';


export default class A8Q2 extends LightningElement {
    @track username;
    @track passward;
    @track result;

    handleName(event){
        this.username = event.target.value;

    }
    handlePass(event){
        this.passward = event.target.value;
    }
    handleLogin(){
        methodName({
            name : this.username,
            pas : this.passward})
        .then(res=>{
            this.result = res;
            })
        .catch(error=>{
            this.result = error;
            })
    }
    
}