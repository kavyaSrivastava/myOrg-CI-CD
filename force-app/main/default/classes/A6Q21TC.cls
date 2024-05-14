@istest
public class A6Q21TC {
    @istest
    public static void meth(){
        Event__c e1 = new event__c();
        e1.Name = 'test';
        e1.Event_Date__c = Date.newInstance(2023, 05, 01);
        insert e1;
        
        Event__c e2 = new event__c();
        e2.Name = 'fest';
        e2.Event_Date__c = Date.newInstance(2023, 05, 01);
        insert e2;
        
        Contact c = new Contact();
        c.LastName = 'srivz';
        insert c;
        
        Event_Participant__c e = new Event_Participant__c();
        e.Name='z';
        e.Contact__c = c.id;
        e.Event__c = e1.id;
        insert e;
        
        Event_Participant__c ept1 = new Event_Participant__c();
        ept1.Contact__c = c.id;
        ept1.Event__c = e2.id;
        ept1.Name = 'p';
        
        System.test.startTest();
        Database.SaveResult r = Database.insert(ept1, false);
        System.test.stopTest();
        
        System.assert(!r.isSuccess());
        
    }

}