public class A6Q14HC {
    public static void meth(List<Event_Participant__c> epl){
        for(Event_Participant__c ep :epl){
            List<Event_Participant__c> epl1 = [select id from Event_Participant__c where Event__c =: ep.Event__c AND Contact__c =: ep.Contact__c];
            if(!epl1.isEmpty()){
                ep.adderror('already in event');
            }
        }
    }

}