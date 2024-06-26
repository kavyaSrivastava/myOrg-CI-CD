import { LightningElement } from 'lwc';

export default class Childcomp2 extends LightningElement {
    searchKey;
    handleChange(event){
        this.searchKey = event.target.value;
        
        const searchEvent = new CustomEvent("getsearchvalue",{
            detail: this.searchKey
        });

        this.dispatchEvent(searchEvent);
    }
}