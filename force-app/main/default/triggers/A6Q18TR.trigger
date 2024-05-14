trigger A6Q18TR on Opportunity (before insert, before update) {
    if(trigger.isinsert&& trigger.isbefore || trigger.isbefore && trigger.isupdate){
        A6Q18HC.meth(trigger.new);
    }

}