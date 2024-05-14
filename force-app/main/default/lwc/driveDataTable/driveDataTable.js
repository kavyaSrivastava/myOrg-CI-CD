import { LightningElement, track } from 'lwc';
import makeGetCallout from '@salesforce/apex/GetAuthService.makeGetCallout'
const actions = [
    { label: 'View', name: 'view' },
    { label: 'Download', name: 'download' }
];
export default class DriveDataTable extends LightningElement {
   @track listView =true;
   @track gridView =false;

    data=[];
    columns=[ 
        {label:'Name', fieldName:'title', type:'string'},
        {label:'Type', fieldName:'mimeType', type:'string'},
        { label: '   Action      ',
        type: 'action',
        initialWidth:'100px',
        typeAttributes: { rowActions: actions},
        },
    ];

    connectedCallback(){
        makeGetCallout()
        .then(result=>{
           // console.log('Get request made successfully>>>>>>',result)
            //const a = JSON.stringify(result);
            this.data = result;
            //this.data.push(obj);
            //console.log('After inserting the results in data>>>>>>>>>>>>>>.', this.data)
        })
        .catch(error=>{
            console.log('Error while making get request>>>>>>')
            console.log(error)
        })
    
    }

    handleRowAction( event ){
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        console.log('row>>>>>>>>>>>' ,row);
        switch ( actionName ) {
            case 'view':
                this.recordId = event.detail.row.id
                console.log('record id>>>>>>>', this.recordId)
                this.data.forEach(element=>{
                    if(element.id === this.recordId){
                        console.log('alternate link is>>>>>>>>>>>>>>>',element.alternateLink);
                        window.open(element.alternateLink)
                    }
                })
                break;
            case 'download':
                this.recordId = event.detail.row.id
                this.data.forEach(element=>{
                    if(element.id === this.recordId){
                        console.log('export link is>>>>>>>>>>>>>>>',element.exportLinks);
                        if(element.exportLinks != null){
                            for(let link of Object.keys(element.exportLinks)){
                                if(link === 'application/pdf'){
                                   window.open(element.exportLinks[link])
                                }
                            } 
                        }
                        else if(element.webContentLink!=null){
                            window.open(element.webContentLink)
                        }
                        else{
                            console.log('This file cant be downloaded')
                        }  
                        }
                    })
                    break;    
                    default:
        }
    }
    handleClick(event){
        
        this.listView = true;
        this.gridView =false;
    }
    handleClickOnGrid(event){
        this.listView = false;
        this.gridView = true;
    }
    handleView(event){
      //  console.log('inside preview>>>>>>>>>>>>' ,event.currentTarget.dataset.id);
      let record = event.currentTarget.dataset.id;
       // record = record.replace("-3","");
       // console.log(record);
        //console.log(record);
        console.log(this.data);
        this.data.forEach(element=>{
            //console.log('.....')
            if(element.id === record){
                // console.log('inside if');
                // console.log('alternate link is>>>>>>>>>>>>>>>',element.alternateLink);
                window.open(element.alternateLink)
            }
           
        })
        
    }
    handleDownload(event){
        console.log('inside download>>>>>>>>>>>>' ,event.currentTarget.dataset.id);
        var record = event.currentTarget.dataset.id;
        // record = record.replace("-3","");

        this.data.forEach(element=>{
            if(element.id === record){
               // console.log('export link is>>>>>>>>>>>>>>>',element.exportLinks);
                if(element.exportLinks != null){
                    for(let link of Object.keys(element.exportLinks)){
                        if(link === 'application/pdf'){
                           window.open(element.exportLinks[link])
                        }
                    } 
                }
                else if(element.webContentLink!=null){
                    window.open(element.webContentLink)
                }
                else{
                    console.log('This file cant be downloaded')
                }  
                }
            })
    }

}