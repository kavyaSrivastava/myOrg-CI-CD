trigger Brainstorming2 on Case (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        Brainstorming2.assignCase(trigger.new);
    }
}