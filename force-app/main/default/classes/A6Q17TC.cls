@istest
public class A6Q17TC {
    @istest
    public static void meth(){
        Contact c = new Contact();
        c.SAME_COUNTRY_AS_USER_COMPANY__c =true;
        c.LastName = 'Kavss';
       // insert c;
        
         system.test.startTest();
        database.SaveResult r= database.insert(c,false);
        system.test.stopTest();
        
        system.assert(!r.isSuccess());
    }

}