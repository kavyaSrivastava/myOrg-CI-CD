trigger Reporttrigger on Account (before update, after update) {
    if (trigger.isbefore && trigger.isupdate){
        system.debug(trigger.new);
        List<Account> acclisttoupdate = new List<Account> ();
        for(account acc: trigger.new){
            for(account acc2 : trigger.old){
                System.debug(acc.getPopulatedFieldsAsMap());
                Map<String, Object> values = acc.getPopulatedFieldsAsMap();
                Map<String, Object> values2 = acc2.getPopulatedFieldsAsMap();
                
                System.debug(values.keyset());
                System.debug(values.get('Id'));
                if(values.get('Id') == values2.get('Id')){
                    if(CheckForFieldUpdate.checkMethod(values, values2)){
                        acclisttoupdate.add(acc);
                    } 
                }
            }
            
            
        }
       
        
        
    }
}