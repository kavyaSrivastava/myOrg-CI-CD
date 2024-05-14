public class NewLeads {
    public static void CollectLeads(){
        List<Lead> ll = [Select id, name, company, Records__c from Lead where Records__c includes ('Tenant;Seller') and createddate = THIS_year];
        system.debug(ll); 
    }

}