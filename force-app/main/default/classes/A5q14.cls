public class A5q14 {
   // public static List<Event_Participant__c> makingevent(){
        public static void makingevent(){
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
       // List<Integer> l = new List<Integer>();
       // List<Event_Participant__c> la = [Select Id From Event_Participant__c WHERE EventContact__c ='Attendee Contact'];
        //l.add(la.size());
       // List<Event_Participant__c> lp = [Select Id From Event_Participant__c WHERE EventContact__c ='Presenter Contact'];
       // l.add(lp.size());
       // List<Event_Participant__c> lc = [Select Id From Event_Participant__c WHERE EventContact__c ='Organizer Contact'];
       // l.add(lc.size());
       // return l;
    }
}