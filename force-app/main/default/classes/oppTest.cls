@istest
public class oppTest {
    @istest
    public static void opptest(){
        System.Test.startTest();
        Opportunities.opp20();
        System.test.stopTest();
        List<Opportunity> opl = [SELECT NAME FROM Opportunity];
        System.assertEquals(20, opl.size());
    }

}