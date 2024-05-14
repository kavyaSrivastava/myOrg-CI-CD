@istest
public class A6Q20TC {
    @istest
    public static void meth(){
     
		Account ac= new Account();
        ac.Name='AccTest';
        ac.ShippingCity='a';
        ac.ShippingCountry='b';
        ac.ShippingPostalCode='20200';
        ac.ShippingState='UP';
        ac.ShippingStreet='ss';
        insert ac;
        Contact con= new Contact();
        con.AccountId=ac.id;
        con.LastName='ConTest';
        
        system.test.startTest();
        insert con;
        system.test.stopTest();
        
        list<contact> c= [SELECT MAILINGADDRESS from CONTACT where Accountid=:ac.id];
 		system.assertEquals('UP', c[0].mailingstate);
    }
}