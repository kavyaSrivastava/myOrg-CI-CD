//On Opportunity do not let the user insert Opportunities with past closed Date with following Message "Please enter a future Closed Date"
@istest
public class A6Q2TC {
    @istest
    public static void meth(){
        Opportunity o = new opportunity();
        o.Name = 'opptest';
        o.StageName = 'closed won';
        o.CloseDate = date.newInstance(2023,02, 12);
         system.Test.startTest();
        database.SaveResult r= database.insert(o,false);
        system.test.stopTest();
        system.Assert(!r.isSuccess());
    }

}