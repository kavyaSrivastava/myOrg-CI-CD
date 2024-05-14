public class oppps {
// Create 20 opps with closedate, stagename and opportunityname
    public static void createopps(){
List<Opportunity> oppList = New List<Opportunity>();
        for(Integer i=1;i<=20;i++){
             Opportunity opp = new Opportunity();
            opp.Name = 'Opp'+i;
            opp.StageName = 'Kavya';
            opp.CloseDate = Date.newInstance(2023, 2, 20);
            oppList.add(opp);
        }
         if(!oppList.isEmpty())
            insert oppList;
    }

}