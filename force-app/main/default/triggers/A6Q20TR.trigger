trigger A6Q20TR on Contact (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        A6Q20HC.method(Trigger.new);
    }

}