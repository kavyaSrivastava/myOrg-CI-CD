trigger Project1Coursec on Uni_Course__c (after update) {
    if(trigger.isafter && trigger.isupdate){
        Project1ClassCourse.meth(trigger.new);
    }
}