trigger A6Q8tr on Campaign (after update) {
    if(trigger.isafter && trigger.isupdate){
        A6Q8.method1(Trigger.new);
    }
}