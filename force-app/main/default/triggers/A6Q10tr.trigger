trigger A6Q10tr on Opportunity (before update) {
    if(trigger.isbefore && trigger.isupdate){
        A6Q10.method1(trigger.new);
    }

}