trigger PrimaryContactTrigger on Account (before insert, before update, before delete) {
    if(trigger.isbefore){
        if(trigger.isinsert){
        PrimaryContactHelper.makingContactPrimary(trigger.new);
     }
        if(trigger.isupdate){
            PrimaryContactHelper.updatingContactsPrimaryField(trigger.new, trigger.old);
        }
        if(trigger.isdelete){
            PrimaryContactHelper.deletinggContactsPrimaryField(trigger.old);
        }
    }


}