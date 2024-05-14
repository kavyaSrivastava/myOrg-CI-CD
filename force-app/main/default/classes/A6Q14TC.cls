@istest
public class A6Q14TC {
    @istest
    public static void meth(){
       
        event__c e = new event__c();
        e.Name ='hbd2';
        insert e;
        
        Contact c= new Contact();
        c.LastName = 'srivv';
        
        Event_Participant__c epic = new Event_Participant__c();
        epic.Name = 'Ktest';
        epic.Event__c = e.Id;
        epic.Contact__c = c.id;
        insert epic;
        
         Event_Participant__c epc = new Event_Participant__c();
         epc.Name = 'Ktest';
         epc.Event__c = e.Id;
         epc.Contact__c = c.id;
        //insert epc;
        System.test.starttest();
        Database.SaveResult r = Database.insert( epc, false);
        System.test.stopTest();
        System.Assert(!r.isSuccess());
      }
}