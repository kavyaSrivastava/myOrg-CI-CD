@isTest
public class A5Q14Test {
   /* @testsetup
    public static void setups(){
        List<Event_Participant__c> epList = new List<Event_Participant__c>();
        
        event__c e= new event__c();
        e.Name = 'Holi101';
        
         Contact c = new Contact();
        c.LastName = 'KavyaS';
        
        for(Integer i =1;i<=10;i++){
        Event_Participant__c ep = new Event_Participant__c();
            
           if(i>0&&i<=4){
                ep.EventContact__c = 'Attendee Contact';
                ep.Event__c= e.Id;
                ep.Contact__c= c.Id;
                epList.add(ep);
            }
            else if(i>4&& i<=8){
                ep.EventContact__c = 'Presenter Contact';
                ep.Event__c= e.Id;
                ep.Contact__c= c.Id;
                epList.add(ep);
            }
            else if(i>8){
                ep.EventContact__c = 'Organizer Contact';
                ep.Contact__c = c.Id;
                ep.Event__c = e.Id;
                epList.add(ep);
            }
           
        }
         insert epList;
 }*/
@istest
    public static void testmethod2(){
        //List<Event_Participant__c> L = A5q14.makingevent();
        A5q14.makingevent();
        List<Integer> ncs = new List<Integer>();
        List<Event_Participant__c> La = [Select Id From Event_Participant__c WHERE EventContact__c ='Attendee Contact'];
         List<Event_Participant__c> Lp = [Select Id From Event_Participant__c WHERE EventContact__c ='Presenter Contact'];
         List<Event_Participant__c> Lo = [Select Id From Event_Participant__c WHERE EventContact__c ='Organizer Contact'];
        ncs.add(La.size());
        ncs.add(Lp.size());
        ncs.add(Lo.size());
        
         System.assertEquals(4, La.size() );
         System.assertEquals(4, Lp.size() );
         System.assertEquals(2, Lo.size() );
       // System.assertEquals({4,4,2}, nc);
        
    }
}