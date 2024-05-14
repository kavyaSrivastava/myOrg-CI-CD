import { LightningElement,api, track, wire } from 'lwc';
import fetchLookupData from '@salesforce/apex/CustomLookupLwcController.fetchLookupData'
export default class CustomLookUp extends LightningElement {
    @track searchkey;
    @api objectName = 'Account';
    @api objectFieldName = 'Name';
    wiredOppResults = [];
    refreshTable;
   @track recordsToDisplay = [];
    

    @track initialRecords;

   

    @wire(fetchLookupData, { sobjectFieldName: '$objectFieldName', sObjectName: '$objectName' })
    accountData(result) {
        this.wiredOppResults = result;
        this.refreshTable = result;
        console.log('res1====>' + result.data)
        console.log('res2====>' + JSON.stringify(result.error))

        if (result.data) {

            this.data = result.data;
            this.initialRecords = result.data;
            console.log('res3===>' + this.data);

            // console.log('res4 ==>' + this.totalRecords)
            // this.pageSize = this.pageSizeOptions[0]; //set pageSize with default value as first option

            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            console.log(this.error);
            this.data = undefined;
        }
    }
 

    handleName(event) {

        const searchKey = event.target.value.toLowerCase();
        console.log('Search String is ' + searchKey);

        if (searchKey) {

            this.recordsToDisplay = this.initialRecords;
            console.log('Opportunities Records are ' + JSON.stringify(this.recordsToDisplay));

            if (this.recordsToDisplay) {

                var recs = [];

                for (let rec of this.recordsToDisplay) {

                    // console.log('Rec is ' + JSON.stringify(rec));
                    // let valuesArray = Object.values(rec);
                    // console.log('valuesArray is ' + JSON.stringify(valuesArray));

                    // for (let val of valuesArray) {

                        // console.log('val is ' + val);
                        // let strVal = String(rec);

                        // if (strVal) {

                            if (rec[this.objectFieldName].toLowerCase().includes(searchKey)) {

                                recs.push(rec);
                                // break;

                            }

                        // }

                    // }

                }

                console.log('Matched Opportunities are ' + JSON.stringify(recs));
                this.recordsToDisplay = recs;

            }

        } else {

            this.recordsToDisplay = this.initialRecords;

        }

    }
}