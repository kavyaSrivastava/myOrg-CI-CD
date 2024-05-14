trigger TriggeronAccountContactObj on ksCAorg__AccountContact__c (before insert, before update, before delete) {
    if(trigger.isbefore)
        if(trigger.isinsert && trigger.isupdate){
        UpdateAccount2.updateAccRecord(trigger.new);
     System.debug('inside trigger');
        }
    /*else if(trigger.isUpdate){
            UpdateAccount2.updateAccRecordOnUpdate(trigger.old, trigger.new)
   }*/

}