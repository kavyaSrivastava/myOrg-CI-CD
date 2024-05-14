@istest
public class test1 {
    @istest
   public static void test(){
       Lead l = new lead();
       l.FirstName ='name';
       l.LastName = 'name';
       l.Company = 'CA';
       l.LeadSource = 'web';
       insert l;
        test.startTest();
       
        
        BatchForLeadUpdate batch1 = new BatchForLeadUpdate();
        id batchid = database.executeBatch(batch1,5);
        
        test.stopTest();
       lead leads = [select rating from lead where id = : l.id ];
       system.assertEquals('Warm',leads.Rating);
        
        
    }
    

}