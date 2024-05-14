global class BatchforAccount implements Database.Batchable<sObject>{
      global List<Account> start(Database.BatchableContext bc){
        //return Database.getQueryLocator('select Name,Id from Account where Name);
        List<Account> a = [SELECT NAME ,Id,ShippingCity, ShippingCountry, ShippingState From Account where NAme like 'Mehta1'];
          return a;
    }
    global void execute(Database.BatchableContext bc,List<Account> scope){
        List<COntact> clist = new List<Contact>();
        
        List<Contact> c = [SELECT ID,NAME, MailingCity, MailingCountry, MailingState FROM Contact where AccountId =: scope[0].id ];
        for(Account acc: scope){
            for(Contact cs : c){
                //if(cs.Accountid == acc.id){
           cs.MailingCity=acc.ShippingCity;
            cs.MailingCountry=acc.ShippingCountry;
            cs.MailingState=acc.ShippingState;
                //}
                  clist.add(cs);
                }
          
                
            }
        update clist;
        }
    
        //update scope;
        
    
    public void finish(Database.BatchableContext bc){
        
    }
 
}