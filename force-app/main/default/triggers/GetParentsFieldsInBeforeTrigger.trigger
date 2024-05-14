trigger GetParentsFieldsInBeforeTrigger on Opportunity (before insert) {
   for(Opportunity opp : Trigger.New) {
        System.debug('accounttype===>' + opp.Account.Type);
       
    }
}