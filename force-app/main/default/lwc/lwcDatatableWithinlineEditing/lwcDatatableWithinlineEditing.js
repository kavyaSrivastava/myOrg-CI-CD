import { LightningElement, api, track } from 'lwc';
import CONTACT_RECORD from
'@salesforce/apex/LwcTaskController.contactRecord';
import updateAccount1 from
'@salesforce/apex/LwcTaskController.updateContact'
import deleteAccount from
'@salesforce/apex/LwcTaskController.deleteAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class LwcDatatableWithinlineEditing extends LightningElement {
@api recordId;
@track contactData=[];
@track isRead=true;
@track deleteId='';
@track name='';
@track Phone=0;
@track accountId='';
@track result=[];
@track title='';
@track successError='';
@track message='';
show(){
const events= new ShowToastEvent({
title: this.title,

message: this.message,
variant:this.successError
})
this.dispatchEvent(events);
}
connectedCallback()
{
console.log(this.recordId);
CONTACT_RECORD({accountId:this.recordId}).then(result=>{
let contactList=[];
contactList=JSON.parse(JSON.stringify(result));
contactList.forEach(element => {
element.isEdit=false;
element.isDelete=false;
});
this.contactData=contactList;
}).catch(error =>{
console.log(error);
})
}
askEditOrNotHandler(event)
{
let indes=event.target.dataset.id;
let newList=[];
newList=this.contactData;
newList.forEach((element,index) => {
if(indes==index){
element.isEdit=true;
this.isRead=true;
}
else{
element.isEdit=false;
}
})
this.contactData=JSON.parse(JSON.stringify(newList));
}
cancelEditHandler(event)
{

let indes=event.target.dataset.id;
let newList=[];
newList=this.contactData;
newList.forEach((element,index) => {
if(indes==index){
element.isEdit=false;
element.isDelete=false;
this.isRead=true;
}
})
this.contactData=JSON.parse(JSON.stringify(newList));
}
deleteRecordHandler(event)
{
let indes=event.target.dataset.id;
let newList=[];
newList=this.contactData;
console.log(newList);
newList.forEach((element,index) => {
if(indes==index){
element.isDelete=true;
element.isEdit=true;
this.isRead=false;
}
else{
element.isDelete=false;
}
})
this.contactData=JSON.parse(JSON.stringify(newList));
}
deleteEditHandler(event)
{
this.deleteId=event.target.value;
console.log(this.deleteId);
deleteAccount({ContactId:this.deleteId}).then(result=>{
console.log(result);
if(result==='success')
{
console.log('result');
this.title='Successful';

this.message='Successfully Delete Contact';
this.successError='success'
this.show();
this.isModalOpen = false;
}
else{
this.title='Failed';
this.message='Failed Delete Contact';
this.successError='error'
this.show();
}
}).catch(error=>{
console.log(error);
})
return this.refreshApex(this.CONTACT_RECORD);
}
getInputAndUpdateHandler(event)
{
if(event.target.name==='acName')
this.name=event.target.value;
if(event.target.name==='Phone')
this.Phone=event.target.value;
}
saveEditedAccountHandler(event)
{
this.accountId=event.target.value;
console.log(this.accountId);
console.log(this.name);
console.log(this.Phone);
updateAccount1({ContactId:this.accountId,Acname:this.name,Phone:this.Phone
}).then(result=>{
console.log(result);
let contactList=[];
contactList=JSON.parse(JSON.stringify(result));
contactList.forEach(element => {
element.isDelete=false;
element.isEdit=false;
this.isRead=false;
});

this.contactData=contactList;
if(result!=null)
{
console.log('result');
this.title='Successful';
this.message='Successfully Update Contact';
this.successError='success'
this.show();
this.isModalOpen = false;
}
else{
this.title='Failed';
this.message='Failed Update Contact';
this.successError='error'
this.show();
}
}).catch(error=>{
console.log(error);
});
this.refreshApex(this.CONTACT_RECORD);
}
}