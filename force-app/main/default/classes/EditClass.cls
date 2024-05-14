public with sharing class EditClass {
    @AuraEnabled
    public static Opportunity editOpportunity( String currentId, String currName, String currStageName, Date currClosedDate){
        
            system.debug(currentId);
            Opportunity opp = new Opportunity();
            opp.id= currentId;
            opp.Name = currName;
            opp.StageName = currStageName;
            opp.CloseDate = currClosedDate;
            update opp;

            if(currentId!=null){
                return opp;
            }
            return null;
        
    }
    // @AuraEnabled
    // public static void delSelectedOppies(String lstConIds ){
    //     try {
    //         Opportunity op = [SELECT Name, Id FROM Opportunity where Id =:lstConIds];
    //         delete op;
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
    
}