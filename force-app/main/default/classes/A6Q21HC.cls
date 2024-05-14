public class A6Q21HC {
    public static void meth(List<Event_Participant__c> ep){
        for(Event_Participant__c e : ep ){
            id eveid= e.Event__c;
            List<Event__c> ev = [select id,event_date__c from event__c where id=:eveid];
            
            //List<Event_Participant__c> l = [SELECT ID FROM Event_Participant__c where Events__r.Event_Date__c =: e.Events__r.Event_Date__c AND Contact__c =: e.Contact__c];
            List<Event_Participant__c> l = [SELECT ID FROM Event_Participant__c where Event__r.Event_Date__c=:ev[0].Event_Date__c AND Contact__c =: e.Contact__c];
            if(!l.isEmpty()){
                e.adderror('can add');
        }
        
    }

    }
}