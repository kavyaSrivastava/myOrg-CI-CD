public class creatingLeads {
    public static void threeleads(){
        List<Lead> leadlist = new List<Lead>();
        For(Integer i = 1;i<=3;i++){
            Lead le = new Lead();
            le.LastName = 'lead'+i;
            le.Company = 'CA'+i;
            leadlist.add(le);
            
        }
        insert leadlist;
}
    public static void creatingcontacts(){
        List<Lead> ll = [SELECT Id, Name From Lead ORDER BY CreatedDate DESC Limit 3];
        List<Product2> plist =new List<Product2>();
        for(Lead l: ll){
            for(Integer i =1;i<=5;i++){
                Product2 p = new Product2();
                p.Name = 'P'+i;
                p.Lead__c = l.Id;
                plist.add(p);
            }
        }
        insert plist;
        
    }

}