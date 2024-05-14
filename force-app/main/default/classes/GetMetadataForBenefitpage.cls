public with sharing class GetMetadataForBenefitpage {
    @AuraEnabled( cacheable=true )  
    public static List < ksCAorg__Metadata_For_Custom_Benefit__mdt > metaDataRec() {
        System.debug('line 4 ' + [ SELECT Id, MasterLabel,ksCAorg__Benefit__c,ksCAorg__Section__c FROM ksCAorg__Metadata_For_Custom_Benefit__mdt ]);
        return [SELECT Id, MasterLabel,ksCAorg__Benefit__c,ksCAorg__Section__c ,ksCAorg__Eligible_for_Bronz__c,ksCAorg__Eligible_for_Enrolled__c,ksCAorg__Eligible_for_Gold__c,ksCAorg__Eligible_for_Silver__c FROM ksCAorg__Metadata_For_Custom_Benefit__mdt ORDER BY ksCAorg__Benefit__c DESC];
        
    }
}