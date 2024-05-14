public class Opportunities {
    public static void opp20(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=1; i<=20; i++){
            Opportunity op = new Opportunity();
            op.CloseDate = Date.newInstance(2023,02,21);
            op.StageName = 'Closed';
            op.Name = 'Vishal'+i;
            oppList.add(op);
        }
        insert(oppList);
    }

}