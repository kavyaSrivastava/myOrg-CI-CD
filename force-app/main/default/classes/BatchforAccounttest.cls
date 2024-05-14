@istest
public class BatchforAccounttest {
    @istest
    public static void meth(){
        Account ac = new Account();
        ac.Name = 'Mehta1';
        ac.ShippingCity ='Lucknow';
        ac.ShippingCountry = 'India';
        ac.ShippingState = 'U.P';
        insert ac;
        Contact c = new COntact ();
        c.AccountId= ac.id;
        //c.Name = 'kavsscon';
        c.LastName = 'srivv';
        insert c;
         test.starttest();
        BatchforAccount batch1 = new BatchforAccount();
        id batchid = database.executeBatch(batch1);
        
        test.stopTest();
       // List<COntact> con =[SELECT ID,MailingCity from contact ];
       
      // system.assertEquals('Lucknow',con[0].MailingCity);
        
    } 

}