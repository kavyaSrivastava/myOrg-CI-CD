trigger InterviewQuesTrig on Invoice__c (after insert,after update) {
    if(trigger.isinsert && trigger.isafter || trigger.isafter && trigger.isupdate){
        InterviewQuesAsyn obj = new InterviewQuesAsyn();
        Id batchid = database.executeBatch(obj);
        
        InterviewQuesTrigHandler.handleMeth(trigger.new);
        
    }
}