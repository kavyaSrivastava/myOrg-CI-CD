Global class A7Q1 implements Database.batchable<sObject> {
     global List<Account> start(Database.BatchableContext bc){
         DateTime dt = system.now();
         DateTime d = dt.addDays(-10);
         List<Account> accl = [SELECT ID FROM Account WHERE CreatedDate>=:d];
         return accl;
     }
    global void execute(Database.BatchableContext bc,List<Account> scope){
        try{
      database.delete(scope,false);
          }
        catch(Exception e){
            system.debug(e);
        }
    
    
    }
    global void finish(Database.BatchableContext bc){
        System.debug('JOb Completed');
    }
}