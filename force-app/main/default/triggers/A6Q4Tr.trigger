trigger A6Q4Tr on Contact (after delete) {
    if(trigger.isafter && trigger.isdelete){
        A6Q4.accupdate(Trigger.old);
    }
}