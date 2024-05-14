import { LightningElement, api, track } from 'lwc';
import methodName1 from "@salesforce/apex/AccountMap.methodName1";
// import getCustomSettings from "@salesforce/apex/AccountMap.companySetting";


export default class LightningMapAccount extends LightningElement {
    @api recordId;
    @track mapMarkers;
    @track longitute;
    @track latitude;
    accessKey ='';

    connectedCallback() {
        methodName1({ accRecordId: this.recordId })

            .then(result => {
                console.log(JSON.stringify(result));
                this.longitude = result[0]
                this.latitude = result[1]
                this.mapMarkers = [{
                    location: {
                        Longitude : this.longitude,
                        Latitude :this.latitude
                    }
                }

                ]

            })
            .catch(error => {
                this.error = error;
            })

          

    }
    


}