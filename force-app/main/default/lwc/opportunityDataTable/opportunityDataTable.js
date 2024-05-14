import { LightningElement, track, wire } from 'lwc';
// importing apex class methods
import getOpportunities from '@salesforce/apex/CollectingOpportunity.getOpportunity';
import delSelectedOppies from '@salesforce/apex/CollectingOpportunity.deleteOpportunities';
import editOpportunity from '@salesforce/apex/EditClass.editOpportunity';
import insertOpportunities from '@salesforce/apex/CollectingOpportunity.insertOpportunities';

// import delSelectedOppies from '@salesforce/apex/EditClass.delSelectedOppies';

//importing object schema
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

import { getPicklistValues } from 'lightning/uiObjectInfoApi';

import Opportunity from '@salesforce/schema/Opportunity';

import StageName from '@salesforce/schema/Opportunity.StageName';
//// datatable columns with row actions. Set sortable = true
// importing to show toast notifictions
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

// importing to refresh the apex if any record changes the datas
import { refreshApex } from '@salesforce/apex';
// import IsClosed from '@salesforce/schema/Case.IsClosed';

// row actions
const actions = [
    { label: 'Record Details', name: 'record_details' },
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' }
];

// datatable columns with row actions
const columns = [
    { label: 'Name', fieldName: 'Name', sortable: "true", cellAttributes: { alignment: 'left' }},
    { label: 'Account Name', fieldName: 'AccountId', sortable: "true", cellAttributes: { alignment: 'left' } },
    // { label: 'Contact Name', fieldName: 'ContactId' }, 
    { label: 'Closed Won', fieldName: 'IsWon', type: 'Boolean', sortable: "true", cellAttributes: { alignment: 'left' } },
    { label: 'Closed Date', fieldName: 'CloseDate', type: 'Date', sortable: "true", cellAttributes: { alignment: 'left' } },
    {label: 'Amount', fieldName: 'Amount', type: 'number', formatter: 'currency', sortable: "true", cellAttributes: { alignment: 'left' }},
    {
        type: 'action',
        typeAttributes: {
            rowActions: actions,
            menuAlignment: 'right'
        }
    }
    
];

export default class OpportunityDataTable extends LightningElement {
    // reactive variable
    @track initialRecords
    @track data = [];
    @track columns = columns;
    @track record = [];
    @track bShowModal = false;
    @track currentRecordId;
    @track isEditForm = false;
    @track showLoadingSpinner = false;
    @track searchKey;
    @track sortBy;
    @track sortDirection;
    @track oppstatus = false;
    @track opportunities;
    @track error;
    @track name1;
    @track date1;
    @track showNewForm = false;
    pageSizeOptions = [5, 10, 25, 50, 75, 100]; //Page size options
    wiredOppResults = [];
    stage = '';
    name = '';
    date;
    totalRecords = 0; //Total no.of records
    pageSize = this.pageSizeOptions[0]; //No.of records to be displayed per page
    totalPages; //Total no.of pages
    pageNumber = 1; //Page number    
    recordsToDisplay = []; //Records to be displayed on the page
    @track newAmount

    // non-reactive variables
    selectedRecords = [];
    refreshTable;
    error;

    // retrieving the data using wire service
    @wire(getOpportunities, { oppstatus: '$oppstatus' })
    opportunity(result) {
        this.wiredOppResults = result;
        this.refreshTable = result;
        console.log('res1====>' + result.data)
        console.log('res2====>' + result.error)

        if (result.data) {

            this.data = result.data;
            this.initialRecords = result.data;
            console.log('res3===>' + this.data);
            this.totalRecords = result.data.length; // update total records count    
            console.log('res4 ==>' + this.totalRecords)
            // this.pageSize = this.pageSizeOptions[0]; //set pageSize with default value as first option
            this.paginationHelper(); // call helper menthod to update pagination logic 
            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            console.log(this.error);
            this.data = undefined;
        }
    }
    

    handleRecordsPerPage(event) {
        this.pageSize = event.target.value;
        this.paginationHelper();
    }

    previousPage() {
        this.pageNumber = this.pageNumber - 1;
        this.paginationHelper();
    }

    nextPage() {
        this.pageNumber = this.pageNumber + 1;
        this.paginationHelper();
    }

    firstPage() {
        this.pageNumber = 1;
        this.paginationHelper();
    }

    lastPage() {
        this.pageNumber = this.totalPages;
        this.paginationHelper();
    }
    
    handleNew(){
    //@track showNewForm = false;
    this.showNewForm = true;
    }


    // JS function to handel pagination logic 
    paginationHelper() {
        this.recordsToDisplay = [];
        // calculate total pages
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
        // set page number 
        if (this.pageNumber <= 1) {
            this.pageNumber = 1;
        } else if (this.pageNumber >= this.totalPages) {
            this.pageNumber = this.totalPages;
        }

        // set records to display on current page 
        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
            if (i === this.totalRecords) {
                break;
            }
            this.recordsToDisplay.push(this.data[i]);
        }
    }

    doSorting(event) {
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;
        this.sortData(this.sortBy, this.sortDirection);
    }
    sortData(fieldname, direction) {
        let parseData = JSON.parse(JSON.stringify(this.recordsToDisplay));
        // Return the value stored in the field
        let keyValue = (a) => {
            return a[fieldname];
        };
        // cheking reverse direction
        let isReverse = direction === 'asc' ? 1 : -1;
        // sorting data
        parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; // handling null values
            y = keyValue(y) ? keyValue(y) : '';
            // sorting values based on direction
            return isReverse * ((x > y) - (y > x));
        });
        this.recordsToDisplay = parseData;
    }
    //for pagination

    get bDisableFirst() {
        return this.pageNumber == 1;
    }

    get bDisableLast() {
        return this.pageNumber == this.totalPages;
    }

    //for searching
    handleSearch(event) {

        const searchKey = event.target.value.toLowerCase();
        console.log('Search String is ' + searchKey);

        if (searchKey) {

            this.recordsToDisplay = this.initialRecords;
            console.log('Opportunities Records are ' + JSON.stringify(this.recordsToDisplay));

            if (this.recordsToDisplay) {

                let recs = [];

                for (let rec of this.recordsToDisplay) {

                    console.log('Rec is ' + JSON.stringify(rec));
                    let valuesArray = Object.values(rec);
                    console.log('valuesArray is ' + JSON.stringify(valuesArray));

                    for (let val of valuesArray) {

                        console.log('val is ' + val);
                        let strVal = String(val);

                        if (strVal) {

                            if (strVal.toLowerCase().includes(searchKey)) {

                                recs.push(rec);
                                break;

                            }

                        }

                    }

                }

                console.log('Matched Opportunities are ' + JSON.stringify(recs));
                this.recordsToDisplay = recs;

            }

        } else {

            this.recordsToDisplay = this.initialRecords;

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
        this.date1 = currentRow.CloseDate;
        this.name1 = currentRow.Name;
        this.stage = null;
        //  this.value = currentRow.StageName;
        console.log('currentroeid=====>' + this.currentRecordId);
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
        console.log("id ==>" + currentRow.Id)
        let currentRecord = [];
        currentRecord.push(currentRow.Id);
        this.showLoadingSpinner = true;

        // calling apex class method to delete the selected contact
        delSelectedOppies({ lstOpportunityIds: currentRecord })
            .then(result => {
                //console.log('result ====> ' + Json.Stringify(result));
                console.log('recordId ==>' + JSON.stringify(this.currentRecord))
                this.showLoadingSpinner = false;

                // showing success message
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success!!',
                    message: currentRow.Name + 'Opportunity deleted.',
                    variant: 'success'
                }),);

                // refreshing table data using refresh apex
                return refreshApex(this.refreshTable);

            })
            .catch(error => {
                window.console.log('Error ====> ' + error);
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error!!',
                    message: error.message,
                    variant: 'error'
                }),);
            });
    }


    fetchclosed(event) {
        if (event.target.title === "IsClosed") {
            this.oppstatus = true;
        }
        else if (event.target.title === "IsOpen") {
            this.oppstatus = false;
        }
    }
   

    @wire(getObjectInfo, { objectApiName: Opportunity })

    accountMetadata;

    // now get the industry picklist values

    @wire(getPicklistValues,

        {

            recordTypeId: '$accountMetadata.data.defaultRecordTypeId',

            fieldApiName: StageName

        }

    )

    industryPicklist;

    // on select picklist value to show the selected value

    handleStageChange(event) {

        this.stage = event.detail.value;

    }
    handle1(event) {
        this.name = event.target.value;
    }
    handle3(event) {
        this.date = event.target.value;
    }

    handlesubmit() {
        console.log("Hello");
        console.log("currentrecordid ====>" + this.currentRecordId);
        console.log("currName ====>" + this.name);
        console.log("currStageName ====>" + this.stage);



        // editOpportunity({ currentId: this.currentRecordId, currName: this.name, currStageName: this.stage, currClosedDate: this.date })
        editOpportunity({ currentId: this.currentRecordId, currName: this.name1, currStageName: this.stage, currClosedDate: this.date1 })

            .then((result) => {
                this.opportunities = result;
                console.log("resq ==>" + JSON.stringify(result));
                this.error = undefined;
                return refreshApex(this.wiredOppResults);
            })
            .catch((error) => {
                this.error = error;
                this.opportunities = undefined;
            });
        this.isEditForm = false;
        this.bShowModal = false;
    }
    @track newName;
    @track newDate;
    @track newStageChange;
 
    handleNewName(event){
        this.newName = event.target.value;
        console.log("newRecordName ==>"+ this.newName);
    }

    handleNewDate(event){
        this.newDate = event.target.value;
        console.log("newRecordDate ==>"+ this.newDate);

    }

    handleNewStageChange(event){
        this.newStageChange= event.detail.value;
        console.log("newRecordStage ==>"+ this.newStageChange);
    }
  
    handleNewAmount(event){
        this.newAmount = event.target.value;
    }

    handleSave(){
        console.log("newRecordName ==>"+ this.newName);
        console.log("newRecordDate ==>"+ this.newDate);
        console.log("newRecordStage ==>"+ this.newStageChange);
        insertOpportunities({newRecordName: this.newName, newRecordStage: this.newStageChange, newRecordDate: this.newDate, newRecordAmount:this.newAmount })
        .then((result) => {
            this.opportunities = result;
            console.log("resq ==>" + JSON.stringify(result));
            this.error = undefined;
            return refreshApex(this.wiredOppResults);

        })
        .catch((error) => {
            this.error = error;
            this.opportunities = undefined;
        });
    this.showNewForm = false;
  
}

handleCancle(){
    this.showNewForm = false;
}

    





}