trigger Project1Student on Uni_Students__c (After insert) {

    if(trigger.isafter && trigger.isinsert){
        Project1StudentC.meth(trigger.new);}
}