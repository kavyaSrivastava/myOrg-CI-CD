public class A6Q12HN {
    public static void meth(List<Opportunity> oppl){
        for(opportunity o: oppl){
            if(o.StageName =='Closed Lost'){
                
                Case c = new Case();
                c.Status = 'New54436365';
                c.Origin = 'Phone';
                //c.ContactId = o.ContactId;
                c.AccountId = o.AccountId;
                c.Description='disfkafkksnkfhaf';
                insert c;
            }
        }
    }
}