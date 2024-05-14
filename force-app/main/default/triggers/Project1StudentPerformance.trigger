trigger Project1StudentPerformance on Uni_Student_Performance__c (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        Project1StudentPC.meth(trigger.new);
    }
}