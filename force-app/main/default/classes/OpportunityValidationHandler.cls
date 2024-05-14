public class OpportunityValidationHandler {
    public static void methodtocheck(List<Opportunity> opplist){
        for(Opportunity opp : opplist){
            if(opp.ksCAorg__User__c != UserInfo.getUserId()  && opp.ksCAorg__User2__c != UserInfo.getUserId() && opp.ksCAorg__User3__c !=  UserInfo.getUserId() && (opp.ksCAorg__field1__c != '' ||opp.ksCAorg__field2__c != false || String.isBlank(opp.ksCAorg__field3__c))){
               opp.addError('You do not have valid permission'); 
            }
        }
    }
}