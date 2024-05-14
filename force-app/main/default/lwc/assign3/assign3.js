import { LightningElement, track} from 'lwc';
import meth from '@salesforce/apex/A8Q3.meth';


export default class Assign3 extends LightningElement {

    @track oppId;
    @track Newd;
    @track Opportunity;
    @track showModal=false;
    handleId(event){
        this.oppId=event.target.value;
    }
    handledate(event){
        this.Newd=event.target.value;
    }
    handleclick(){
        meth({
            opId:this.oppId,
            cd:this.Newd
        })
        .then(result=>{
            this.Opportunity=result;
            this.showModal=true;
        })
        .catch(error=>{
            this.Opportunity=error;
        })
    }
    popup(){
        window.open(this.Opportunity, "popupWindow", "width=600,height=400");
    }}