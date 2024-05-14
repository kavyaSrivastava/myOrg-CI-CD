import { LightningElement, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
const FIELDS = ["Oportunity.Name", "Oportunity.StageName", "Opportunity.CloseDate"];


export default class ShowOppPopup extends LightningElement {
    @api recordId;
    showpopup = false;

//   @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
//   opportunity;
@wire(getRecord, { recordId: "$recordId", fields: FIELDS })
  opportunity ({ error, data }) {
    if (data) {
      this.displayColumns = data.displayColumns;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.displayColumns = undefined;
    }
  }

  get name() {
    console.log('stage' , this.opportunity.data.fields.Name.value);
    return this.opportunity.data.fields.Name.value;
  }

  get stage() {
    console.log('stage' , this.opportunity.data.fields.StageName.value);
    if(this.opportunity.data.fields.StageName.value === 'Closed Won');
    this.showpopup = true;
    console.log('Showpopup => ', this.showpopup);

    return this.opportunity.data.fields.StageName.value;
  }

  get closeDate() {
    return this.opportunity.data.fields.CloseDate.value;
  }

//   get email() {
//     return this.opportunity.data.fields.Email.value;
//   }
}