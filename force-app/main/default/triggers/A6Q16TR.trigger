trigger A6Q16TR on Opportunity (before update) {
    if(trigger.isbefore && trigger.isupdate){
        A6Q16HC.meth(trigger.new);
    }

}