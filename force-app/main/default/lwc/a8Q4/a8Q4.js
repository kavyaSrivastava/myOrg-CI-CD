import { LightningElement, track } from 'lwc';
import methodName from '@salesforce/apex/A8Q4.methodName';
import methodName1 from '@salesforce/apex/A8Q4.methodName1';
import methodName2 from '@salesforce/apex/A8Q4.methodName2';
import methodName3 from '@salesforce/apex/A8Q4.methodName3';

const columns =[{label:'Account Name', fieldName:'Name'}];

    export default class A8Q4 extends LightningElement {
        @track columns=columns;
       @track searchKey;
        @track data=[];
        
      connectedCallback(){
        methodName1()
        .then(result=>{
            console.log(JSON.stringify("result="+result))
            this.data = result;
        })
        .catch(error=>{
            this.error = 'error';
        })
      }

      handlechange(event){
        this.searchKey = event.target.value;
        console.log("......"+this.searchKey);
        methodName({str:this.searchKey})
        .then(result=>{
            this.data=result;
        })
        .catch(error=>{
            this.data =error;
        })
    }

    handleclick(){
        methodName2({str:this.searchKey})
        .then(result=>{
            this.data=result;
        })
        .catch(error=>{
            this.data=error;
        })
    }

    handleclick1(){
        methodName3({str:this.searchKey})
        .then(result=>{
            this.data=result;
        })
        .catch(error=>{
            this.data=error;
        })
    }

}