global class BatchApexExample implements Database.Batchable<sObject> {
    global Database.QueryLocator Start(Database.BatchableContext bc){
        String query =' SELECT Id, Name FROM Account';
            return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Account> accList){
        for(Account acc: accList){
            acc.Name = acc.Name +'DEHRADUN';
            
        }
        try {
            update accList;}
        catch(Exception e){
            System.debug(e);
        }
    }
    global void finish (Database.BatchableContext bc){
        
    }

}