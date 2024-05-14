public class A5Q14c {
    public static void meth(){
        List<Opportunity> opp = [SELECT Id , AccountId FROM Opportunity Where AccountId!=NULL];
    }
}