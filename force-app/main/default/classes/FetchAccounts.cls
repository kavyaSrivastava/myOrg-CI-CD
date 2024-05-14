public without sharing class FetchAccounts {
    @AuraEnabled
    public static List<Account> fetchingAcc(){
        try {
            List<Account> accList = [SELECT ID, Name, Approval_Status__c, BillingState, Website, Phone, Industry, Type  FROM Account ];
            System.debug(accList);
             
            if(accList.size()>0){
                return accList;
            }
            else 
            return null;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account LIMIT 200];
    }
    @AuraEnabled
    public static List<Account> fetchingAccWithStatus(){
        try {
            List<Account> accList = [SELECT ID, Name, Approval_Status__c, BillingState, Website, Phone, Industry, Type FROM Account WHERE Approval_Status__c Like 'Requested']; 
            if(accList.size()>0){
                return accList;
            }
            else 
            return null;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updatingRecord(String id){
        try {
           System.debug( 'id is===' + id );
            Account acc = new Account();
            acc.Approval_Status__c = 'Requested';
            acc.id = id;
            update acc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public  static String updatingAccRecord(String id, String status){
        try {
            System.debug('Id>>>>>>>>>'+id);
            System.debug('Status>>>>>>>>>'+ status);
            Account acc = new Account();
            acc.Approval_Status__c = status;
            acc.id = id;
            update acc;
            return 'true';
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void callingPlatformEvent(String id, String calledFrom){
        try {
            system.debug('called from==='+ calledFrom);
            if(calledFrom == 'Aura'){
                system.debug('Inside if Aura');
                List<AuraToLWC__e> recordIdForApproval = new List<AuraToLWC__e>();
                AuraToLWC__e rec = new AuraToLWC__e(RecId__c = id);
                recordIdForApproval.add(rec);
                List<Database.SaveResult> results = EventBus.publish(recordIdForApproval);

                for (Database.SaveResult sr : results) {
                    if (sr.isSuccess()) {
                        System.debug('Successfully published event.');
                    }
                    else {
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('Error returned: ' + err.getStatusCode() );
                        }
                    }
                }
            }
           else if(calledFrom == 'LWC'){
            List<LWCtoAura__e> recordIdForApproval = new List<LWCtoAura__e>();
            LWCtoAura__e rec = new LWCtoAura__e(RecId__c = id);
            System.debug(id);
            recordIdForApproval.add(rec);
            List<Database.SaveResult> results = EventBus.publish(recordIdForApproval);
 
            for (Database.SaveResult sr : results) {
                if (sr.isSuccess()) {
                    System.debug('Successfully published event.');
                }
                 else {
                     for(Database.Error err : sr.getErrors()) {
                         System.debug('Error returned: ' + err.getStatusCode() );
                     }
                 }
            }

         }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}