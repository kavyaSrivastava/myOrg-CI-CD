@istest
public class BST1Q7 {
    @testsetup
    public static void setupmeth(){
        Account a= new Account();
        a.Name = 'testacc';
        insert a;
        list<Opportunity> oppl = new list<Opportunity>();
        for(integer i =1;i<=20;i++){
         Opportunity o = new Opportunity();
        o.AccountId = a.id;
        o.CloseDate = Date.newInstance(2023, 02, 2);
        o.StageName = 'Closed Won';
        o.Name = a.Name + 'ooo'+ i;
            oppl.add(o);
        }
        insert oppl;
        
    }
    @istest
    public static void meth(){
        test.startTest();
        BST1Q6.getallAcc();
        test.stopTest();
        Date s = Date.newInstance(2023, 01, 31);
        Date e = Date.newInstance(2023, 02, 28);
        List<Opportunity> a = [SELECT Account.Name FROM Opportunity WHERE StageName = 'Closed Won' AND CloseDate>=: s AND CloseDate <= : e];
        Set<Id> accid  = new set<Id>();
        for(Opportunity o: a){
            accid.add(o.AccountId);
        }
        System.assertEquals(1, accid.size());        
    }
    
}