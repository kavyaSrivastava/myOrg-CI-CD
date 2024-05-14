import { LightningElement, track } from 'lwc';
import methodTofetch from '@salesforce/apex/FetchMessageRecords.methodTofetch'
import methodToUpdate from '@salesforce/apex/FetchMessageRecords.methodToUpdate'


export default class MessageUtilityComponent extends LightningElement {
    @track records;
    @track error;
    @track listOfMember=[];
    @track listOfEmail=[];
    @track listOfMessages=[];
    @track areMessageVisible = false;
    @track emailOfMem;
    connectedCallback(){
        methodTofetch()
            .then((result) => {
                this.records = result;
                console.log('<<<<<<<<<<<', JSON.stringify(this.records)); 
                this.records.forEach((curr)=>{
                    console.log('123',JSON.stringify(curr));
                    if(!this.listOfEmail.includes(curr.Email__c)){
                        console.log('234');
                        this.listOfMember.push(curr);
                        this.listOfEmail.push(curr.Email__c);
                        console.log('listOfMember>>>>>',JSON.stringify(this.listOfMember));
                        console.log('listOfEmail>>>>>',JSON.stringify(this.listOfEmail));


                    }
                        })

              })
              .catch((error) => {
                this.error = error;
                console.log('<<<<<<<<<<<', JSON.stringify(this.error)); 
              });
                  
             }
   myFunction(event)
   {
    console.log('event value---',JSON.stringify(event.currentTarget.dataset.name));
    this.emailOfMem = event.currentTarget.dataset.name;
    console.log(this.emailOfMem);
     this.records.forEach((curr)=>{
         //console.log('123',JSON.stringify(curr));
         if(curr.Email__c == this.emailOfMem ){
            console.log('ln 44');
            this.areMessageVisible = true;
             this.listOfMessages.push(curr);
             
             console.log('listOfMessages>>>>>',JSON.stringify(this.listOfMessages));


         }
             })
   }  
   handleChange(event){
    console.log('value' , event.target.value);
    methodToUpdate({message:event.target.value  , EmailOfEmp:this.emailOfMem })
    .then((result)=>{
         console.log('result', JSON.stringify(result));
         this.listOfMessages.push(result);
         console.log('%%', this.listOfMessages);
    })
    .catch((error)=>{ 
        this.error = error;
        console.log('<<<<<<<<<<<', JSON.stringify(this.error)); })

   }   

  
}