public class CheckForDeadContacts2 {
    public static void checkGorDeadHandler2(List<Contact> listAcc){
        Set<Id> setOfAccIds = new Set<Id>();
        for(Contact acc: listAcc){
           setOfAccIds.add(acc.AccountId);
           }
        List<Account> conlist = [Select id ,(SELECT ID, ksCAorg__Dead__c from contacts) from account where Id =: setOfAccIds ];
        List<Account> deadConList = [Select id ,(SELECT ID, ksCAorg__Dead__c from contacts where ksCAorg__Dead__c = true ) from account where Id =: setOfAccIds];
        Map<Id, Boolean> IdVsBlocked = new Map<id, Boolean>();
       // List<contact> conlist = [SELECT ID, ksCAorg__Dead__c from contact where AccountId =: setOfAccIds ];
       // List<contact> deadConList = [SELECT ID, ksCAorg__Dead__c from contact where ksCAorg__Dead__c = true where AccountId =: setOfAccIds];
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
        update blockedAccounts;
        
    }
public class wrapperMap{
    public id accid;
    public Integer contactsize;
    public Integer deadcontacts;
    public wrapperMap( id accid, Integer contactsize, Integer deadcontacts){
        this.accid =accid;
        this.contactsize = contactsize;
        this.deadcontacts = deadcontacts;
    }
}
}