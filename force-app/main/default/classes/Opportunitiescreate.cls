public class Opportunitiescreate {
    public static void cresteoppor(){
        List<Opportunity> oppList = New List<Opportunity>();
        for(Integer i=1;i<5;i++){
             Opportunity opp = new Opportunity();
            opp.Name = 'Opp'+i;
            opp.StageName = 'Needs Analysis';
            opp.CloseDate = Date.newInstance(2023, 2, 20);
            oppList.add(opp);
        }
         if(!oppList.isEmpty())
            insert oppList;
       
    }
}