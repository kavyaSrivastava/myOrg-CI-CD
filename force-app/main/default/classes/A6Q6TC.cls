@istest
public class A6Q6TC {
    @istest
    public static void meth(){
        
        Opportunity op = new Opportunity();
        op.Name = 'triggertestop';
        op.StageName = 'Qualification';
        op.CloseDate = date.newInstance(2023, 11, 3);
        insert op;
        
         op.StageName = 'Closed Won';
        
          System.test.startTest();
           database.SaveResult r= database.update(op,false);
          System.test.stopTest();
          System.Assert(!r.isSuccess());
    }

}