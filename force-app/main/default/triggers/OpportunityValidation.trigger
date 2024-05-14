trigger OpportunityValidation on Opportunity (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        OpportunityValidationHandler.methodtocheck(trigger.new);
    }
}