trigger AccountTrigger on Account (after insert) {
    if(trigger.isinsert && trigger.isafter){
        Question1HandlerClasses.answer1Handler(trigger.new);
    }
}