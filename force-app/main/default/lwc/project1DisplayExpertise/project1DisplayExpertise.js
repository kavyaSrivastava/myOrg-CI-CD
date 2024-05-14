import { LightningElement, track} from 'lwc';
import methodName from '@salesforce/apex/Project1ShowExpertise.methodName'

const columns = [{label:'Professor Name', fieldName:'Name'},
{label:'Expertise', fieldName:'Eperties__c'}];


export default class Project1DisplayExpertise extends LightningElement {
      @track columns= columns;
      @track data;

      connectedCallback(){

         methodName()
            .then(result=>{  

          this.data = result; 
            })
           .catch(error=>{
            this.data='error';
                  })
         }
}