public class CreateContactsClass {
    public static void methodToCreateContactsAfterInsert(List<Account> accListInserted){
        List<Contact> createdConList =  new  List<Contact>();
        for(Account acc :accListInserted ){
            for(Integer i =0; i<(Integer)acc.ksCAorg__Count__c; i++){
                createdConList.add(new Contact(LastName = 'Created'+ i, AccountId = acc.Id ));
            }
        }
        if(!createdConList.isEmpty())
            insert createdConList;
    }
    public static void methodToCreateContactsAfterInsert1(List<Account> newrecords, Map<Id, Account> mapold){
        List<Account> accList  = new List<Account>();
        try{
            if(!newrecords.isEmpty() && newrecords != null ){
                for(Account acc : newrecords){
                    if(mapold != null && mapold.size() > 0) {
                        if(mapold.get(acc.Id).ksCAorg__Count__c != acc.ksCAorg__Count__c) accList.add(acc);  
                    }
                    else  accList.add(acc);
                }
            }
            if(!accList.isEmpty())
                methodToCreateContactsAfterInsert(accList); 
        }
        catch(DmlException e){
            System.debug('Error occured = ' + e.getLineNumber() + ' ' + e.getMessage());
        }
        
    }
}