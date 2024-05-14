trigger demotrigger2 on Contact (before insert, before update) {
    if(trigger.isbefore ){
        if(trigger.isupdate){
                    StopCreatingDuplicate.meth(trigger.newMap);

        }
        else if(trigger.isinsert){
                    StopCreatingDuplicate.meth1(trigger.new);

        }
    }
}