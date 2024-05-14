trigger AfterInsertTrigger on Campaign (Before insert) {
    If(trigger.isBefore && trigger.isinsert){
        /*For(Campaign c : trigger.new){
            List<Campaign> campList = [SELECT Id, Name From Campaign where id =: c.id ];
            System.debug( 'trigger.new===' + trigger.new);
            System.debug('rec==>'+campList);

        }*/
        //Campaign campList = [SELECT Id, Name From Campaign where id =: trigger.new[0].id ];
        System.debug(trigger.new[0]);
        
    }
}