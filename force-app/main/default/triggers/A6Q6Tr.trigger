trigger A6Q6Tr on Opportunity (before update) {
    if(trigger.isbefore && trigger.isupdate){
        A6Q6.alertuser(Trigger.new);
    }
}