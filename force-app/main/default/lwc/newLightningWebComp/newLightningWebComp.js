// wireListInfoByName.js
import { LightningElement, wire } from 'lwc';
import { getListInfoByName } from 'lightning/uiListsApi';
import CASE_OBJECT from '@salesforce/schema/Case';
export default class WireListInfoByName extends LightningElement {
  error;
  displayColumns;
  @wire(getListInfoByName, {
    objectApiName: CASE_OBJECT.objectApiName,
    listViewApiName: 'MyCase',
  })
  listInfo({ error, data }) {
    if (data) {
      this.displayColumns = data.displayColumns;
      this.error = undefined;
    } else if (error) {
      console.log('error==>', error.body.message);
      this.error = error;
      this.displayColumns = undefined;
    }
  }
}

//NewLightningWebComp