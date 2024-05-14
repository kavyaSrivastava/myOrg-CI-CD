import { LightningElement,track } from 'lwc';


export default class ParentComp2 extends LightningElement {
    @track searchValue;
    handleSearchValue(event){
        this.searchValue = event.detail;
    }
   
}