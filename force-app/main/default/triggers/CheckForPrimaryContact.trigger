trigger CheckForPrimaryContact on Contact (after insert,before delete) {
    /*if(trigger.isbefore){
        if(trigger.isupdate){
            CheckForPrimaryContactHandler.checkPrimary(Trigger.new);
        }
       
    }*/
     if(trigger.isdelete && trigger.isbefore){
            CheckForPrimaryContactHandler.assignPrimaryContact(trigger.old);
        }
    if(trigger.isafter && trigger.isinsert ){
            CheckForPrimaryContactHandler.checkPrimary(Trigger.new);
        }
}