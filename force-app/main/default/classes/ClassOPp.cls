public class ClassOPp {
    public static void main(){
        Opportunity opp = new Opportunity();
        opp.Name = 'kas';
        opp.CloseDate = Date.newInstance(01,12,2023);
        opp.StageName = 'Closed won';
        insert opp;
    }
}