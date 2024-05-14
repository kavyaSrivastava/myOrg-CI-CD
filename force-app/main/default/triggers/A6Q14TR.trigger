trigger A6Q14TR on Event_Participant__c (before insert) {
    if (trigger.isbefore && trigger.isinsert){
        A6Q14HC.meth(trigger.new);
    }
}