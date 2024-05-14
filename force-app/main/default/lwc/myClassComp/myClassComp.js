import { LightningElement, track, wire} from 'lwc';
import getAcc2 from '@salesforce/apex/MyClass22.getAcc2';

export default class MyClassComp extends LightningElement {
    @track searchkey;
    @wire(getAcc2, {text :"$searchkey"}) Account
    onchange1(event)
    {
        this.searchkey = event.target.value;
    }

}