import { LightningElement, api, wire } from 'lwc';
import SALES_BENEFITS from '@salesforce/label/c.Sales_Benefit';
import MARKETING_BENEFITS from '@salesforce/label/c.Marketing_Benefits';
import ENHANCEMENT_BENEFITS from '@salesforce/label/c.Enhancement_Benefits';
import Partner_Level from '@salesforce/schema/Account.Partner_Level__c';
import { getRecord } from 'lightning/uiRecordApi';
import metaDataRec from '@salesforce/apex/GetMetadataForBenefitpage.metaDataRec';

const columns = [
    { label: 'Benefits', fieldName: 'ksCAorg__Benefit__c3', hideDefaultActions : true },
    { label: 'Benefits', fieldName: 'ksCAorg__Benefit__c2', hideDefaultActions : true },
    { label: 'Benefits', fieldName: 'ksCAorg__Benefit__c1', hideDefaultActions : true },
    { label: 'Benefits', fieldName: 'ksCAorg__Benefit__c0', hideDefaultActions : true },
];

export default class BenefitComponent extends LightningElement {
    @api recordid;
    activeSectionMessage = '';
    salesBenefit;
    marketingbenefit;
    enhancementbenefit;
    currentRecordData;
    level;
    metadata;
    recdata = [];
    error;
    //columns = [];
    column = columns;
    column1 = [];
    column2 = [];
    sectiondata = [];
    sectiondataMarketing = [];
    sectiondataEnhance = [];
    connectedCallback() {
        this.marketingbenefit = MARKETING_BENEFITS;
        this.salesBenefit = SALES_BENEFITS;
        this.enhancementbenefit = ENHANCEMENT_BENEFITS;

        // for (let index = 0; index < 4; index++) {
        //     this.columns.push({ label: 'Benefits', fieldName: 'ksCAorg__Benefit__c' + index });
        // }
        // this.column = this.columns;
        // console.log('columns==' , JSON.stringify(this.column) );
        this.handleLoad();

    }
    handleLoad() {
        metaDataRec()
            .then((result) => {
                this.recdata = result;
                if (this.recdata) {
                    console.log('this.recdatadsdsdsds', this.recdata);
                    this.defaultAccordion(SALES_BENEFITS);
                }

            })
            .catch((error) => {
                this.error = error;
            });



    }

    handlesalesClick(event) {
        this.defaultAccordion(event.target.label);
    }
  

    defaultAccordion(accordionlabel, accordionlabel1) {
        console.log('accordionlabel==', accordionlabel1);

        console.log('ln 59 ::: ', accordionlabel);
        this.sectiondata = [];
        let sectiondata =[]
        if (this.sectiondata.length == 0) {
            console.log('--', JSON.stringify(this.column));
            this.recdata.forEach(element => {
                if (element.ksCAorg__Section__c === accordionlabel) {
                    let ksCAorg__Benefit__c0,
                        ksCAorg__Benefit__c1,
                        ksCAorg__Benefit__c2,
                        ksCAorg__Benefit__c3;
                    let secobj = { ksCAorg__Benefit__c3, ksCAorg__Benefit__c2, ksCAorg__Benefit__c1, ksCAorg__Benefit__c0 };
                    if (element.ksCAorg__Eligible_for_Enrolled__c === false) {
                        secobj.ksCAorg__Benefit__c3 = null;
                    }
                    else {
                        secobj.ksCAorg__Benefit__c3 = element.ksCAorg__Benefit__c;
                    }
                    if (element.ksCAorg__Eligible_for_Bronz__c === false) {
                        secobj.ksCAorg__Benefit__c2 = null;
                    } else {
                        secobj.ksCAorg__Benefit__c2 = element.ksCAorg__Benefit__c;
                    }
                    if (element.ksCAorg__Eligible_for_Silver__c === false) {
                        secobj.ksCAorg__Benefit__c1 = null;
                    }
                    else {
                        secobj.ksCAorg__Benefit__c1 = element.ksCAorg__Benefit__c;
                    }
                    if (element.ksCAorg__Eligible_for_Gold__c === false) {
                        secobj.ksCAorg__Benefit__c0 = null;
                    }
                    else {
                        secobj.ksCAorg__Benefit__c0 = element.ksCAorg__Benefit__c;
                    }
                    this.sectiondata.push(secobj);
                }

            });
            this.sectiondata = [...this.sectiondata];
            console.log('this.sectiondata',  this.sectiondata );
            console.log('sectiondata',  sectiondata );
            sectiondata =  this.sectiondata;
            console.log('this.secdat',  sectiondata );
        }
    }
    
    // handleMarketingClick(event) {
    //    // this.columns = [];
    //     if (this.sectiondataMarketing.length == 0) {
    //         // for (let index = 0; index < 4; index++) {
    //         //     this.columns.push({ label: 'Benefits', fieldName: 'ksCAorg__Benefit__c' + index });
    //         // }
    //         // this.column1 = columns;
    //         this.recdata.forEach(element => {
    //             if (element.ksCAorg__Section__c === event.target.label) {
    //                 let ksCAorg__Benefit__c0;
    //                 let ksCAorg__Benefit__c1;
    //                 let ksCAorg__Benefit__c2;
    //                 let ksCAorg__Benefit__c3;
    //                 let secobj = { ksCAorg__Benefit__c0, ksCAorg__Benefit__c1, ksCAorg__Benefit__c2, ksCAorg__Benefit__c3 };
    //                 if (element.ksCAorg__Eligible_for_Enrolled__c === false) {
    //                     secobj.ksCAorg__Benefit__c3 = null;
    //                 }
    //                 else {
    //                     secobj.ksCAorg__Benefit__c3 = element.ksCAorg__Benefit__c;
    //                 }
    //                 if (element.ksCAorg__Eligible_for_Bronz__c === false) {
    //                     secobj.ksCAorg__Benefit__c2 = null;
    //                 } else {
    //                     secobj.ksCAorg__Benefit__c2 = element.ksCAorg__Benefit__c;
    //                 }
    //                 if (element.ksCAorg__Eligible_for_Silver__c === false) {
    //                     secobj.ksCAorg__Benefit__c1 = null;
    //                 }
    //                 else {
    //                     secobj.ksCAorg__Benefit__c1 = element.ksCAorg__Benefit__c;
    //                 }
    //                 if (element.ksCAorg__Eligible_for_Gold__c === false) {
    //                     secobj.ksCAorg__Benefit__c0 = null;
    //                 }
    //                 else {
    //                     secobj.ksCAorg__Benefit__c0 = element.ksCAorg__Benefit__c;
    //                 }
    //                 this.sectiondataMarketing.push(secobj);
    //             }
    //         });
    //     }
    // }
    // handleEnhancementClick(event) {
    //   //  this.columns = [];
    //     if (this.sectiondataEnhance.length == 0) {
    //         // for (let index = 0; index < 4; index++) {
    //         //     this.columns.push({ label: 'Benefits', fieldName: 'ksCAorg__Benefit__c' + index });
    //         // }
    //          //this.column2 = columns;
    //         this.recdata.forEach(element => {
    //             if (element.ksCAorg__Section__c === event.target.label) {
    //                 let ksCAorg__Benefit__c0;
    //                 let ksCAorg__Benefit__c1;
    //                 let ksCAorg__Benefit__c2;
    //                 let ksCAorg__Benefit__c3;
    //                 let secobj = { ksCAorg__Benefit__c0, ksCAorg__Benefit__c1, ksCAorg__Benefit__c2, ksCAorg__Benefit__c3 };
    //                 if (element.ksCAorg__Eligible_for_Enrolled__c === false) {
    //                     secobj.ksCAorg__Benefit__c3 = null;
    //                 }
    //                 else {
    //                     secobj.ksCAorg__Benefit__c3 = element.ksCAorg__Benefit__c;
    //                 }
    //                 if (element.ksCAorg__Eligible_for_Bronz__c === false) {
    //                     secobj.ksCAorg__Benefit__c2 = null;
    //                 } else {
    //                     secobj.ksCAorg__Benefit__c2 = element.ksCAorg__Benefit__c;
    //                 }
    //                 if (element.ksCAorg__Eligible_for_Silver__c === false) {
    //                     secobj.ksCAorg__Benefit__c1 = null;
    //                 }
    //                 else {
    //                     secobj.ksCAorg__Benefit__c1 = element.ksCAorg__Benefit__c;
    //                 }
    //                 if (element.ksCAorg__Eligible_for_Gold__c === false) {
    //                     secobj.ksCAorg__Benefit__c0 = null;
    //                 }
    //                 else {
    //                     secobj.ksCAorg__Benefit__c0 = element.ksCAorg__Benefit__c;
    //                 }
    //                 this.sectiondataEnhance.push(secobj);
    //             }
    //         });
    //     }
    // }

}