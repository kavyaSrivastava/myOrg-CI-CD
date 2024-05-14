public class UpdateAccount {
    public static void updateAccRecord(List<ksCAorg__AccountContact__c> recList){
       Map<Id, Integer> accidVscountmap = new Map<Id, Integer>();
        Map<Id, Integer> contactvscountmap = new Map<Id, Integer>();
       
        for(ksCAorg__AccountContact__c acccon : recList){
            if(accidVscountmap.containsKey(acccon.ksCAorg__Account_Id__c)){
                accidVscountmap.put(acccon.ksCAorg__Account_Id__c, accidVscountmap.get(acccon.ksCAorg__Account_Id__c)+1);
            }
            else{
                 accidVscountmap.put(acccon.ksCAorg__Account_Id__c,1);
            }
        }
        Set <Id> accountids = new Set<id>();
         accountids = accidVscountmap.keySet();
       // List<Account> allacc = [SELECT Id, from Account  ];
      list<ksCAorg__AccountContact__c> contactAccLIst = [SELECT ID,ksCAorg__Account_Id__c, ksCAorg__Contact_Id__c From ksCAorg__AccountContact__c where id In: accountids ];
      
       List<Account> accList = [SELECT ID,ksCAorg__CountCon__c From Account where id In: accountids ];
        List<Account> accListtoupdate = new List<Account> ();
        for(Account acc: accList ){
            
            if(accidVscountmap.containsKey(acc.Id) ){
                acc.ksCAorg__CountCon__c =  acc.ksCAorg__CountCon__c+accidVscountmap.get(acc.Id);
                
                accListtoupdate.add(acc);
            }
        }
 /*for(Account acc: accList ){
     for(ksCAorg__AccountContact__c acc2 :contactAccLIst ){
         
      if(accidVscountmap.containsKey(acc.Id) ){
                acc.ksCAorg__CountCon__c =  acc.ksCAorg__CountCon__c+accidVscountmap.get(acc.Id);
                
                accListtoupdate.add(acc);
            }
     }}*/
        update accListtoupdate;
        
        
        
    }

}