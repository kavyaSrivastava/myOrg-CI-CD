public with sharing class A8Q3 {
    @AuraEnabled
    public static Opportunity meth(Id opId, Date cd){
        try {
            Opportunity opList=[SELECT Closedate FROM Opportunity WHERE Id=:opId];
            
                opList.Closedate=cd;
            
            update opList;
            return opList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}