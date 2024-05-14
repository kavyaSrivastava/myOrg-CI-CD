public class CheckForDeadContacts {
    public static void checkGorDeadHandler(List<Account> listAcc){
        Set<Id> setOfAccIds = new Set<Id>();
        for(Account acc: listAcc){
           setOfAccIds.add(acc.Id);
           }
        List<Account> conlist = [Select id ,(SELECT ID, ksCAorg__Dead__c from contacts) from account where Id =: setOfAccIds ];
        List<Account> deadConList = [Select id ,(SELECT ID, ksCAorg__Dead__c from contacts where ksCAorg__Dead__c = true ) from account where Id =: setOfAccIds];
        Map<Id, Boolean> IdVsBlocked = new Map<id, Boolean>();
        
        for(Account a :conlist){
          for(Account a2 :deadConList){
              if( a.Id == a2.Id && !IdVsBlocked.containsKey(a.Id)){
                  Integer contactCount = a.contacts.size();
                  Integer deadcontactCount = a2.contacts.size();
                  Integer percentageofdead = (deadcontactCount / contactCount)*100;
                  if(percentageofdead > 70){
                      IdVsBlocked.put(a.Id, true);
                      
                  }
                  else{
                      IdVsBlocked.put(a.Id, false);
                  }
              }
        }  
        }
          List<Account> blockedAccounts = new List<Account>();
        for(id i : IdVsBlocked.keySet()){
            if(IdVsBlocked.get(i) == true){
                Account acc = new Account();
                acc.id = i;
                acc.ksCAorg__Blocked__c = true;
                blockedAccounts.add(acc);
            }
        }
        insert blockedAccounts;
    }
}