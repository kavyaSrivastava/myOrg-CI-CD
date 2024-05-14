trigger A6Q17TR on Contact (before insert) {
    if (trigger.isbefore && trigger.isinsert){
        A6Q17HC.meth(trigger.new);
    }
}