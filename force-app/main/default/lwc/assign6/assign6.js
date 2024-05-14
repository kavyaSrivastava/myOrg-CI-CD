import { LightningElement, api,track } from 'lwc';
import methodName1 from '@salesforce/apex/A8Q6.methodName1';
import methodName2 from '@salesforce/apex/A8Q6.methodName2';
import methodName3 from '@salesforce/apex/A8Q6.methodName3';


const columns = [{label:'Contacts Last Name', fieldName:'LastName'},
{label:'Contacts Email', fieldName:'Email'}];

const oppcolumns = [{label:'Opportunity Name', fieldName:'Name'},
{label:'Opp StageName', fieldName:'StageName'}];


export default class Assign6 extends LightningElement {
   @api arr=[];
   @api value='';
    
   @api columns= columns;
   @api oppcolumns= oppcolumns;
   @track data=[];
   @track oppdata=[];
   @track contactvisibility=false;
   @track oppovisibility = false;


   get options(){
    return this.arr;
   }


    connectedCallback(){
        methodName1()
        .then(result=>{
            let array=[];
           // console.log(JSON.stringify(result));
            for(var i= 0; i<result.length;i++){
          array.push({label:result[i].Name, value:result[i].Id})
            }
            this.arr=array;

        })
        .catch(error=>{
            console.log(JSON.stringify("Error Occoured"));
        })

        

        
    }

//     handleChange(event){
//         this.contactvisibility = true;
//         this.oppovisibility = true;
//         this.value = event.detail.value;
//         methodName2({accId:this.value})
//         .then(result=>{
//             console.log(JSON.stringify('hhhhhhhh'+result))
//             this.data=result;
//         })
//         .catch(error=>{
//          window.alert("error");
//         })

//         methodName3({accId:this.value})
//         .then(result=>{
//             console.log(JSON.stringify('opppp data'+result))
//             this.oppdata=result;
//         })
//         .catch(error=>{
//             window.alert("error");
//         })
//     }
 }