@istest
public class FreeTest {


    @istest
    public static void tstClassForPrimaryContact() {
        Contact c = new Contact();
        c.LastName = 'lucknow';
        c.IsPrimary__c = false;
        insert c;

     //   List<Contact> conlist = [SELECT Id, LastName, IsPrimary__c  FROM Contact WHERE LastName lIKE '%lucknow%' Limit 1];
        //  System.debug(conlist);
        //  
       List<Contact> conlist = [SELECT Id, LastName, IsPrimary__c  FROM Contact Where IsPrimary__c = false ];
        System.debug(conlist);

        Account acc = new Account();
        acc.Name = 'Lucknow';
        acc.Primary_Contact__c = conlist[0].Id;
        
        insert acc;

        test.startTest();
        update acc;
        
        test.stopTest();
        
        Account acco = [SELECT Id,Name, Primary_Contact__c FROM Account WHERE Name like 'Lucknow'];
        System.debug(acco);
        Contact cl =[SELECT Id, LastName, IsPrimary__c FROM Contact WHERE Id =: acco.Primary_Contact__c];
        System.debug(cl);


        System.assertEquals(true , cl.IsPrimary__c);
    
    }

}