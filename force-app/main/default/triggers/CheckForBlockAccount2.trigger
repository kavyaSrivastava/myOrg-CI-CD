trigger CheckForBlockAccount2 on Contact (after insert, after update) {
   if(trigger.isafter && (trigger.isinsert || trigger.isupdate) ){
        CheckForDeadContacts2.checkGorDeadHandler2(trigger.new);
    }
}