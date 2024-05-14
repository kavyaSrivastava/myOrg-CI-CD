trigger A6Q11tr on Account (after insert) {
    if(trigger.isafter && trigger.isinsert){
        A6Q11.method1(Trigger.new);
    }

}