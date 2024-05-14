trigger BST1Q9TR on Appointment__c (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        BST1Q9.meth(Trigger.new);
    }
}