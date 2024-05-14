trigger A6Q21TR on Event_Participant__c (before insert) {
    if(trigger.isbefore && trigger.isinsert)
        A6Q21HC.meth(trigger.new);

}