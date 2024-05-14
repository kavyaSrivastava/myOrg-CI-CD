trigger CreatingWorkorderForCase on Case (after insert) {
    if(trigger.isafter && trigger.isinsert){
                CreatingWorkOrderHandler.creatingwo(trigger.new);
    }

}