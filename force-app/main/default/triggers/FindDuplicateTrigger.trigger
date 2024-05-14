trigger FindDuplicateTrigger on Contact ( before insert, after insert, before update, after update ) {
    // 
    if(trigger.isbefore){
        if(trigger.isInsert){
          FieldDuplicateTriggerHandler.processBeforeInsert(trigger.new);  
        //    update conlist;
         }
    }       
    if(trigger.isbefore && trigger.isupdate){
       FieldDuplicateTriggerHandler.beforeUpdate(trigger.newMap, trigger.oldMap, trigger.new);
    }
}       