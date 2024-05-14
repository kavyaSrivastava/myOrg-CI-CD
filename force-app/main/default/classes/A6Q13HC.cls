public class A6Q13HC {
    public static void meth(List<Plan_T__c> pl){
        for(Plan_T__c c: pl){
            if (c.TRavel_dis__c >100){
                c.adderror('cant enter');
            }
            else{
            List<Plan_T__c> p =[SELECT  id, TRavel_dis__c from Plan_T__c  where Name =: c.Name];
            Decimal totaldis=0;
            for(Plan_T__c pp:p){
               totaldis+= pp.TRavel_dis__c+c.TRavel_dis__c;
                
            }
            
            if (totaldis>=100){
                c.adderror('cant add');
            }
            else{
                c.Total_travel_hour__c =totaldis+c.TRavel_dis__c;
               // update c;
            }}
        }
    }

}