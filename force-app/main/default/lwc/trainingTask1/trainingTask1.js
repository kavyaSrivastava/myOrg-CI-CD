import { LightningElement, track } from 'lwc';
import insertAccount from '@salesforce/apex/TrainingClass.insertAccount';

export default class TrainingTask1 extends LightningElement {  
    @track isShowModal = false;
    @track d;
    @track dtt;
    @track n;
    @track c;
    @track SaveAccount;

    handle1(event){
        this.n = event.target.value;
    }

    handle2(event){
        this.d = event.target.value;
    }

    handle3(event){
        this.dtt = event.target.value;
    }

    handle4(event){
        this.c = event.target.value;
    }
    SaveAccount(){
        insertAccount({ str :this.n, dt :this.d, dttm :this.dtt, b :this.c})
       
        .then(result => {
            
         JSON.stringify(result);
         
        })
        .catch(error => {
            JSON.stringify("unsuccess");
        })
    }

    


    showModalBox() {  
        this.isShowModal = true;
    }


    








}