trigger A6Q12TR on Opportunity (after insert) {
    if(trigger.isafter && trigger.isinsert ){
        A6Q12HN.meth(trigger.new);
    }

}