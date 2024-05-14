trigger CheckForBlockAccount on Account (after insert) {
    if(trigger.isafter & trigger.isinsert){
        //CheckForDeadContacts.checkGorDeadHandler(trigger.new);
    }
}