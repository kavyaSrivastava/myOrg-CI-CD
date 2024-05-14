import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MyFirstLwc extends LightningElement {
    showtost = 'This is to show tost';

    handleClick(){
       this.showToast();
    }


    showToast(){
        const event = new ShowToastEvent({
            title: 'toast event',
            message: "want to display toast example",
            varient: "error",
        })
        this.dispatchEvent(event);
    }
}