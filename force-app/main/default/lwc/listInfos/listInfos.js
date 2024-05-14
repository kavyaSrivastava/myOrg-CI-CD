// wireListInfoByName.js
import { LightningElement, wire } from "lwc";
import { getListInfoByName } from "lightning/uiListsApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
export default class ListInfos extends LightningElement {

  error;
  displayColumns;
  @wire(getListInfoByName, {
    objectApiName: ACCOUNT_OBJECT.objectApiName,
    listViewApiName: "AllAccounts",
  })
  listInfo({ error, data }) {
    if (data) {
      this.displayColumns = data.displayColumns;
      console.log('displayColumns', displayColumns);
      this.error = undefined;
    } else if (error) {
      console.log('error', error);
      this.error = error;
      this.displayColumns = undefined;
    }
  }
}