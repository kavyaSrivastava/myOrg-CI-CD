import { LightningElement,track} from 'lwc';
import getaccount from '@salesforce/apex/A8Q4C.getAccount';
import getsearchAccount from '@salesforce/apex/A8Q4C.getsearchAccount';
import sortedaccounts from '@salesforce/apex/A8Q4C.sortedaccounts';
const columns=[{label:"Account Name",fieldName:"Name"},{label:"Account Site",fieldName:"Site"},
{label:"Account Website",fieldName:"Website"}               
];
export default class Accountsearchingandsorting extends LightningElement {

    @track columns=columns;
    @track name;
    @track data=[];
    
    connectedCallback()
    {
        getaccount()
        .then(response=>{
            console.log('zxc', response);
            this.data=response;
        })
        .catch(error=>{
            console.log(JSON.stringify("ERROR"));
        })
    }
    handlechange(event)
    {
        this.name=event.target.value;
        console.log('handlechange')
        getsearchAccount({Name:this.name})
        .then(response=>{
            console.log('zxcv', response)
            this.data=response;
        })
        .catch(error=>{
            console.log(JSON.stringify("ERROR"));
        })
    }

    
    onclickchange()
    {
        sortedaccounts()
        .then(response=>{
            this.data=response;
            console.log('Sortred data='+response);
        })
        .catch(error=>{
            console.log("sorted data error");
        })
    }
}