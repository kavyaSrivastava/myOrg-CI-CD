@istest
public class A4Q16Test {
@testsetup
    public static void oppsetup(){
        Opportunity op = new Opportunity();
        op.CloseDate = Date.newInstance(2023, 04, 01);
        op.Name = 'testop';
        op.StageName = 'Closed won';
        insert op;
    }
    @istest
    public static void testset(){
        Opportunity16.updateName();
        List<Opportunity> oo= [SELECT Name FROM Opportunity ];
    // String oo= [SELECT Name FROM Opportunity ];
        System.assertEquals('testopF', oo[0].Name);
    }
}