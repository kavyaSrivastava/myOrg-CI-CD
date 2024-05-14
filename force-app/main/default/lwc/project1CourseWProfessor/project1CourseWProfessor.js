import { LightningElement, track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import methodName from '@salesforce/apex/Project1CourseWProfessor.methodName';


export default class Project1CourseWProfessor extends LightningElement {
@track results;
    
    connectedCallback(){
       // this.showToast();
       methodName()
       .then(result=>{
      this.results = result;
      this.showToast();
       })
       .catch(error=>{
        this.results = 'error';
       })
    }

    showToast(){
        const event = new ShowToastEvent({
            title: 'ALERT',
            message: 'There are still couses which do not have Professor assigned',
            variant :'success',
        })
        this.dispatchEvent(event);
    }
}