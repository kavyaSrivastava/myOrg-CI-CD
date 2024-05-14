public class AccOne {
    public static void meth1(ksCAorg__AccountContact__c recList){
       Set<Id> listacc = new Set<Id>();
      /*  for(ksCAorg__AccountContact__c acc : recList){
        listacc.add(acc.ksCAorg__Account_Id__c);
    }*/
          list<Account> lisOfContactsPresentInOrg = [Select Id,ksCAorg__CountCon__c, (Select Id, ksCAorg__Account_Id__c,ksCAorg__Contact_Id__c From AccountContacts__r) From Account ];
    for( Account acc: lisOfContactsPresentInOrg ){
        Set<Id> acc1 = new Set<Id>();
        Integer count = 0;
        for(ksCAorg__AccountContact__c c: acc.AccountContacts__r){
            acc1.add(c.ksCAorg__Contact_Id__c);
           
        }
        acc.ksCAorg__CountCon__c = acc1.size();
      }
    
    update lisOfContactsPresentInOrg;
    }
}