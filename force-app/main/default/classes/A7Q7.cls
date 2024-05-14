global class A7Q7 implements database.Batchable<sObject> {
    global List<Account> start(database.BatchableContext bc){
        List<Account> accl =[SELECT ID,Count__c, (SELECT Id from contacts) FROM Account];
        return accl;
    }
    global void execute (database.BatchableContext bc, List<Account>  scope ){
        List<Account> al = new List<Account>();
        for( Account a  : scope){
            a.count__c = a.Contacts.size();
            al.add(a);
        }
        update al;
        
    }
    global void finish(database.BatchableContext bc){
        
    }

}