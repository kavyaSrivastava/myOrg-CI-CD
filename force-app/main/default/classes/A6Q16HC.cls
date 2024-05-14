public class A6Q16HC {
    public static void meth(List<Opportunity> oppl){
        List<Pricebook2> pb = [SELECT id,NAme from Pricebook2 where Name like 'ASIA' OR Name like 'EMA' OR Name like 'NA' OR Name like 'SA'];
            list<id> ids = new list<id> ();
            for(pricebook2 ps: pb){
               ids.add(ps.id);
            }
            
        for(opportunity o : oppl){
            
            if(o.Account.Working_in__c!='ASIA' || o.Account.Working_in__c!='EMA' || o.Account.Working_in__c!='NA' || o.Account.Working_in__c!='SA'){
                for(id i:ids){
                    if(o.Pricebook2Id ==i){
                        o.adderror('cant add pricebook');
                    }
                }
           }
        }
    }

}