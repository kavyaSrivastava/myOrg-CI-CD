Trigger A6Q1Tr on Account (after insert) {
    if(trigger.isafter && trigger.isinsert){
        A6Q1.coninsert(Trigger.new);
    }
}