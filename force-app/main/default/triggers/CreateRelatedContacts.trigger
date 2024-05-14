trigger CreateRelatedContacts on Account (after insert, after update) {
    if(trigger.isafter && (trigger.isinsert || trigger.isupdate)){
        CreateContactsClass.methodToCreateContactsAfterInsert1(trigger.new, trigger.oldMap);
    }
    
}