public class A5Q7 {
    public static List<Opportunity> NumberofEmployee(String accid){
        List<Opportunity> oppl = [SELECT AccountId,Id,Name, StageName FROM Opportunity WHERE AccountId =: accId];
            return oppl;
        
    }

}