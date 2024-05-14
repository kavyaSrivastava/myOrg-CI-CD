public with sharing class CollectingOpportunity {
    // @AuraEnabled(Cacheable = true)
    // public static List<Opportunity> getOpportunity(Boolean oppstatus){
    //     try {
    //         //ContactId,
    //        List<Opportunity> oppl = [Select Name, AccountId,  IsWon, CloseDate, IsClosed, Amount, StageName From Opportunity Where IsClosed =: oppstatus];
    //        return oppl;
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }

    @AuraEnabled
    public static void deleteOpportunities(list<Id> lstOpportunityIds){
        try {
            list<sObject> lstOppToDelete = new list<sObject>();
            System.debug('lstOpportunityIds ====> '+lstOpportunityIds);
            for(Id idOpp : lstOpportunityIds) {
                lstOppToDelete.add(new Opportunity(Id = idOpp));
            }
            if(!lstOppToDelete.isEmpty()) {
                delete lstOppToDelete;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

   // LWC Method For Creating a New Record - ------------------------------------------------------------------------------------------------------------------
    @AuraEnabled
    public static void insertOpportunities(String newRecordName, String newRecordStage, Date newRecordDate, Decimal newRecordAmount ){
        try {
            list<Opportunity> lstOpportunities = new list<Opportunity>();
            Opportunity op = new Opportunity();
            op.Name = newRecordName;
            op.StageName = newRecordStage;
            op.CloseDate = newRecordDate;
            op.Amount = newRecordAmount;
            lstOpportunities.add(op);
            
            if(!lstOpportunities.isEmpty()){
                insert lstOpportunities;
            }
            
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // Method to edit record for aura as well as LWC -----------------------------------------------------------------------------------------------------------
    @AuraEnabled
    public static sObject editOppMeth(String currentId, String currName, String currStageName, Date currClosedDate, Decimal amt){
        system.debug(currentId + currName + currClosedDate + amt);
        Opportunity opp = new Opportunity();
        opp.id= currentId;
        opp.Name = currName;
        opp.StageName = currStageName;
        opp.CloseDate = currClosedDate;
        opp.amount = amt;
        update opp;
        

        if(currentId!=null){
            return opp;
        }
        return null;
    }

    // Aura Method for getting Picklist Value --------------------------------------------------------------------------------------------------------------------
    @AuraEnabled 
    public static Map<String, String> getStageFieldValue(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {
            
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }


    //Aura Method For Creating New Record -------------------------------------------------------------------------------------------------------------------------
    @AuraEnabled
    public static void createOpportunity(sObject oppObj){
        try {
            insert oppObj;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
            
    }
}
    @AuraEnabled(Cacheable = true)
    public static List<Opportunity> getOpportunity(Boolean oppstatus){
        system.debug('Inside APex class');
        try {
            String query = 'SELECT ';
        for(Schema.FieldSetMember f : SObjectType.Opportunity.FieldSets.Opportunity_Firld_Set.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM opportunity Where IsClosed =: oppstatus';
        System.debug(query);
        
        return Database.query(query);
    }
            
    catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
 }
}
    

}