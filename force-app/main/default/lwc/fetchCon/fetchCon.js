import { LightningElement, track, wire } from 'lwc';
import FetchingContactsFromOrgMeth from '@salesforce/apex/FetchingContactsFromOrg.FetchingContactsFromOrgMeth'

export default class FetchCon extends LightningElement {
@track searchkey;
@wire(FetchingContactsFromOrgMeth, {text :'$searchkey'}) Contact
onchange1(event){
    this.searchkey = event.target.value;
}
}