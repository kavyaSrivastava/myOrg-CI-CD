trigger newTriggerOnAcc on ksCAorg__AccountContact__c (after insert) {
 if(trigger.isafter && trigger.isinsert){
   AccOne.meth1(trigger.new[0]);
 }
}