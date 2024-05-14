trigger A6Q13TRZ on Plan_T__c (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        A6Q13HC.meth(trigger.new);
    }
}