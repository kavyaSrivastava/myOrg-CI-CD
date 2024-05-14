@isTest
public class opppstest {
    @isTest
    public static void createoppstest()
    {
        System.Test.startTest();
        oppps.createopps();
        System.Test.stopTest();
        List<Opportunity> opList = [SELECT Name from opportunity where name like 'Opp%'];
        System.assertEquals(20, opList.Size(),'Mismatched');
        
    }

}