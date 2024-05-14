trigger A9CountCourse on Uni_Course__c (after insert) {
    if(trigger.isafter && trigger.isinsert){
        A9HCL.meth(trigger.new);
    }

}