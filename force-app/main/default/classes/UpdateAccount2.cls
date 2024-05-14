public class UpdateAccount2 {
    public static void updateAccRecord(List<ksCAorg__AccountContact__c> recList){
        Map <Id,Set<Id>> map1 = new Map <Id, Set<Id>>();
        //Set<Id> contactIdset = new Set<Id> ();
        // Map< Id, Integer > map2 = new Map <Id, Integer>();
        
        
        for(ksCAorg__AccountContact__c acccon : recList){
            if(!map1.containsKey(acccon.ksCAorg__Account_Id__c)){
                Set<Id> contactIdset = new Set<Id> ();
                Id accid = acccon.ksCAorg__Account_Id__c;
                contactIdset.add(acccon.ksCAorg__Contact_Id__c);
                map1.put(acccon.ksCAorg__Account_Id__c,contactIdset );
            }
            else{
                Set <Id> conId = new Set<Id>();
                conId = map1.get(acccon.ksCAorg__Account_Id__c);
                conId.add(acccon.ksCAorg__Contact_Id__c);
                map1.put(acccon.ksCAorg__Account_Id__c,conId);
                
            }
        }
        List<Account> accListtoupdate = new List<Account> ();
        Set <Id> accountids = new Set<id>();
        accountids = map1.keySet();
        
        list<ksCAorg__AccountContact__c> lisOfContactsPresentInOrg = [Select Id, ksCAorg__Account_Id__c, ksCAorg__Contact_Id__c From ksCAorg__AccountContact__c];
        for(ksCAorg__AccountContact__c ac : lisOfContactsPresentInOrg){
            if(map1.containsKey(ac.ksCAorg__Account_Id__c)){
                if(map1.get(ac.ksCAorg__Account_Id__c).contains(ac.ksCAorg__Contact_Id__c)){
                    map1.get(ac.ksCAorg__Account_Id__c).remove(ac.ksCAorg__Contact_Id__c);
                }
            } 
        }
        
        List<Account> accList = [SELECT ID,ksCAorg__CountCon__c From Account where id In: accountids ];

        for(Account acc: accList ){
            if(map1.containsKey(acc.Id) ){
                acc.ksCAorg__CountCon__c =  acc.ksCAorg__CountCon__c+ map1.get(acc.Id).size();
                accListtoupdate.add(acc);
            }
        }
        
        update accListtoupdate;
        
        
    }
    public static void updateAccRecordOnUpdate(List<ksCAorg__AccountContact__c> recList1,List<ksCAorg__AccountContact__c> recList2){
        // list<ksCAorg__AccountContact__c> lisOfContactsPresentInOrg = [Select Id, ksCAorg__Account_Id__c, ksCAorg__Contact_Id__c From ksCAorg__AccountContact__c];
          Map <Id,Set<Id>> map1 = new Map <Id, Set<Id>>();
          for(ksCAorg__AccountContact__c acccon : recList1){
            if(!map1.containsKey(acccon.ksCAorg__Account_Id__c)){
                Set<Id> contactIdset = new Set<Id> ();
                Id accid = acccon.ksCAorg__Account_Id__c;
                contactIdset.add(acccon.ksCAorg__Contact_Id__c);
                map1.put(acccon.ksCAorg__Account_Id__c,contactIdset );
            }
            else{
                Set <Id> conId = new Set<Id>();
                conId = map1.get(acccon.ksCAorg__Account_Id__c);
                conId.add(acccon.ksCAorg__Contact_Id__c);
                map1.put(acccon.ksCAorg__Account_Id__c,conId);
                
            }
        }
         List<Account> accListtoupdate = new List<Account> ();
        Set <Id> accountids = new Set<id>();
        accountids = map1.keySet();
        Set<Id> setOfAccountContactsId = new Set<Id>();
        for(ksCAorg__AccountContact__c acid : recList1){
            setOfAccountContactsId.add(acid.id);
        }
        list<ksCAorg__AccountContact__c> lisOfContactsPresentInOrg = [Select Id, ksCAorg__Account_Id__c, ksCAorg__Contact_Id__c From ksCAorg__AccountContact__c where ksCAorg__Account_Id__c NOT IN: setOfAccountContactsId ];
        for(ksCAorg__AccountContact__c ac : lisOfContactsPresentInOrg){
            if(map1.containsKey(ac.ksCAorg__Account_Id__c)){
                if(!map1.get(ac.ksCAorg__Account_Id__c).contains(ac.ksCAorg__Contact_Id__c)){
                    map1.get(ac.ksCAorg__Account_Id__c).remove(ac.ksCAorg__Contact_Id__c);
                }
            } 
        }
        for(ksCAorg__AccountContact__c recl1 :recList1){
            
        }
    }
}