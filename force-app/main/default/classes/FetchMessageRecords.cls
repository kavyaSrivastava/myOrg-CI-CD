public class FetchMessageRecords {
    @AuraEnabled
    public static list<Messanger__C> methodTofetch(){
        List<Messanger__c> messangerList = [SELECT Id, Name, Email__c, Message__c from Messanger__c];
        return messangerList;
    }
    @AuraEnabled
    public static Messanger__C methodToUpdate(String message, String EmailOfEmp){
        try {
            Messanger__c mess1 = new Messanger__c();
            mess1.Message__c = message;
            mess1.Email__c = EmailOfEmp;
            insert mess1;
            return mess1;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}