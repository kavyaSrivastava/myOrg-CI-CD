trigger A6Q2Tr on Opportunity (before insert) {
 if(trigger.isbefore && trigger.isinsert){
        A6Q2.opclosedate(Trigger.new);
    }
}