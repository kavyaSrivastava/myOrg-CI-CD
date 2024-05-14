import { LightningElement, track, wire } from 'lwc';

// importing apex class methods
import getOpportunities from '@salesforce/apex/CollectingOpportunity.getOpportunity';
import delSelectedOppies from '@salesforce/apex/CollectingOpportunity.deleteOpportunities';

// importing to show toast notifictions
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

// importing to refresh the apex if any record changes the datas
import {refreshApex} from '@salesforce/apex';

// row actions
const actions = [
 { label: 'Record Details', name: 'record_details'}, 
    { label: 'Edit', name: 'edit'}, 
    { label: 'Delete', name: 'delete'}
];

// datatable columns with row actions
const columns = [
    { label: 'Name', fieldName: 'Name' }, 
    { label: 'Account Name', fieldName: 'AccountId' },
    // { label: 'Contact Name', fieldName: 'ContactId' }, 
    { label: 'Closed Won', fieldName: 'IsWon', type: 'Boolean' }, 
    { label: 'Closed Date', fieldName: 'CloseDate', type: 'Date'},
    {
        type: 'action',
        typeAttributes: {
            rowActions: actions,
            menuAlignment: 'right'
        }
    }
];

export default class Task2Comp4 extends LightningElement {
     // reactive variable
     @track initialRecords
     @track data;
     @track columns = columns;
     @track record = [];
     @track bShowModal = false;
     @track currentRecordId;
     @track isEditForm = false;
     @track showLoadingSpinner = false;
     @track searchKey;
 
     // non-reactive variables
     selectedRecords = [];
     refreshTable;
     error;
 
     // retrieving the data using wire service
     @wire(getOpportunities)
     opportunity(result) {
        this.refreshTable = result;
        //  console.log('res1====>' +result.data)
        //  console.log('res2====>' +result.error)

         if (result.data) {
           
             this.data = result.data;
             this.initialRecords = result.data;
            //  console.log('res3===>' + this.data);
             this.error = undefined;
 
         } else if (result.error) {
             this.error = result.error;
             console.log(this.error);
             this.data = undefined;
         }
     }
 

     handleSearch( event ) {

        const searchKey = event.target.value.toLowerCase();
        console.log( 'Search String is ' + searchKey );

        if ( searchKey ) {

            this.data = this.initialRecords;
            console.log( 'Opportunities Records are ' + JSON.stringify( this.data ) );
            
            if ( this.data ) {

                let recs = [];
                
                for ( let rec of this.data ) {

                    console.log( 'Rec is ' + JSON.stringify( rec ) );
                    let valuesArray = Object.values( rec );
                    console.log( 'valuesArray is ' + JSON.stringify( valuesArray ) );
 
                    for ( let val of valuesArray ) {

                        console.log( 'val is ' + val );
                        let strVal = String( val );
                        
                        if ( strVal ) {

                            if ( strVal.toLowerCase().includes( searchKey ) ) {

                                recs.push( rec );
                                break;
                        
                            }

                        }

                    }
                    
                }

                console.log( 'Matched Opportunities are ' + JSON.stringify( recs ) );
                this.data = recs;

             }
 
        }  else {

            this.data = this.initialRecords;

        }        

    }
     handleRowActions(event) {
         let actionName = event.detail.action.name;
 
         window.console.log('actionName ====> ' + actionName);
 
         let row = event.detail.row;
 
         window.console.log('row ====> ' + row);
         // eslint-disable-next-line default-case
         switch (actionName) {
             case 'record_details':
                 this.viewCurrentRecord(row);
                 break;
             case 'edit':
                console.log('inside edit=====>' + row);
                 this.editCurrentRecord(row);
                 break;
             case 'delete':
                 this.deleteCons(row);
                 break;
         }
     }
 
     // view the current record details
     viewCurrentRecord(currentRow) {
         this.bShowModal = true;
         this.isEditForm = false;
         this.record = currentRow;
     }
 
     // closing modal box
     closeModal() {
         this.bShowModal = false;
     }
 
 
     editCurrentRecord(currentRow) {
         // open modal box
         this.bShowModal = true;
         this.isEditForm = true;
 
         // assign record id to the record edit form
         this.currentRecordId = currentRow.Id;
         console.log('currentroeid=====>' +this.currentRecordId);
     }
 
     // handleing record edit form submit
     handleSubmit(event) {
         // prevending default type sumbit of record edit form
         event.preventDefault();
 
         // querying the record edit form and submiting fields to form
         this.template.querySelector('lightning-record-edit-form').submit(event.detail.fields);
 
         // closing modal
         this.bShowModal = false;
 
         // showing success message
         this.dispatchEvent(new ShowToastEvent({
             title: 'Success!!',
             message: event.detail.fields.Name + ' Opportunity updated Successfully!!.',
             variant: 'success'
         }),);
 
     }
 
     // refreshing the datatable after record edit form success
     handleSuccess() {
         return refreshApex(this.refreshTable);
     }
 
     deleteCons(currentRow) {
         let currentRecord = [];
         currentRecord.push(currentRow.Id);
         this.showLoadingSpinner = true;
 
         // calling apex class method to delete the selected contact
         delSelectedOppies({lstConIds: currentRecord})
         .then(result => {
             window.console.log('result ====> ' + result);
             this.showLoadingSpinner = false;
 
             // showing success message
             this.dispatchEvent(new ShowToastEvent({
                 title: 'Success!!',
                 message: currentRow.FirstName + ' '+ currentRow.LastName +' Contact deleted.',
                 variant: 'success'
             }),);
 
             // refreshing table data using refresh apex
              return refreshApex(this.refreshTable);
 
         })
         .catch(error => {
             window.console.log('Error ====> '+error);
             this.dispatchEvent(new ShowToastEvent({
                 title: 'Error!!', 
                 message: error.message, 
                 variant: 'error'
             }),);
         });
     }
 
}