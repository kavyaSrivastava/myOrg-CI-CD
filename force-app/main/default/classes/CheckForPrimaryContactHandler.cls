public class CheckForPrimaryContactHandler {
    public static void checkPrimary(list<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con :conList ){
            if(con.accountId != null)
                accIds.add(con.AccountId);
        }
        List<account> accWithconList = [SELECT id, ksCAorg__Primary_Contact__c, (Select Id, ksCAorg__IsPrimary__c from contacts) From Account where id=:accIds];
        System.debug('accWithconList==>'+accWithconList);
        List<account> aclist = new List<Account>();
        List<Contact> updatingContactList = new List<Contact>();
        for(Contact con :conList ){
            Boolean hasprimary = false;
            for(account acc :accWithconList ){
                if(con.AccountId == acc.id && acc.contacts!= null){
                    System.debug('accWithconList16==>'+acc.contacts);
                    
                    for(contact c : acc.contacts){
                        if(c.id != con.id && hasprimary != true)
                            hasprimary = c.ksCAorg__IsPrimary__c;
                    }
                    System.debug('hasprimary==>'+hasprimary);
                    if(hasprimary == true && con.ksCAorg__IsPrimary__c == true){
                        // con.addError('The related account already have a primary contact.');
                        
                        contact c = new Contact();
                        c.id = con.id; 
                        c.ksCAorg__IsPrimary__c = false;
                        updatingContactList.add(c);
                    }
                    else if(hasprimary == false && con.ksCAorg__IsPrimary__c == false){
                        contact c = new Contact();
                        c.id = con.id; 
                        c.ksCAorg__IsPrimary__c = true;
                        acc.ksCAorg__Primary_Contact__c = con.id;
                        updatingContactList.add(c);
                        aclist.add(acc);
                    }
                }
               //  if(con.AccountId == acc.id && acc.contacts!= null)
            }
            
            
        }
        System.debug(aclist);
        System.debug(updatingContactList);
        update updatingContactList;
        update aclist;
        
    }
    /*   public static void processAfterUpdate(list<Contact> newContact , map<Id, Contact> oldContactmap){
for(Contact con : newContact){
if(oldContactmap.containskey(con.Id) && con.ksCAorg__IsPrimary__c != oldContactmap.get(con.id).ksCAorg__IsPrimary__c || ){

}
}

}*/
    public static void assignPrimaryContact(List<Contact> deletedConlist){
        Set<Id> accIds = new Set<Id> ();
        for(Contact con : deletedConlist ){
            if(con.ksCAorg__IsPrimary__c== true){
                accids.add(con.AccountId);
            }
        }
        List<Account> accListtoupdate = new  List<Account>();
        List<Account> accList = [SELECT id, ksCAorg__Primary_Contact__c, (Select Id, ksCAorg__IsPrimary__c,createdDate from contacts order by createdDate desc) From Account where id=:accIds];
        System.debug('accList'+accList);
        for(contact c : deletedConlist){
            for( Account acc : accList){
                if(acc.contacts != null && c.id != accList[0].contacts[0].Id ){
                    acc.ksCAorg__Primary_Contact__c = accList[0].contacts[0].Id;
                    accList[0].contacts[0].ksCAorg__IsPrimary__c = true;
                    accListtoupdate.add(acc);
                }
                else{
                    acc.ksCAorg__Primary_Contact__c = accList[1].contacts[1].Id;
                     accList[0].contacts[0].ksCAorg__IsPrimary__c = true;
                    accListtoupdate.add(acc);                    
                }
            }   
        }
        
        update accListtoupdate;
    } 
}