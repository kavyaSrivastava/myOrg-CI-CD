import { LightningElement, api } from 'lwc';
import convert from '@salesforce/apex/ConvetESTtoLocale.convert'

export default class ShowLocaleBasedTimeDate extends LightningElement {
    @api recordId;
    record;
    error;
    connectedCallback(){
        console.log('123####>>>>>>', this.recordId);
        this.methodToConvert();
    }

    methodToConvert(){
        console.log('inside methodToconvert');
        convert({recId : this.recordId})
        .then((result)=> {
            this.record = result;
            
            console.log('<<<<<<<<<<<', JSON.stringify(this.record)); 
        }
       
        )
        .catch((error) => {
            this.error = error;
            console.log('<<<<<<<<<<<', JSON.stringify(this.error)); 
          });
    
    }
    
}