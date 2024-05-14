trigger A9RestrictCourse on Uni_Professor__c (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        A9HC.meth(trigger.new);
    }
}