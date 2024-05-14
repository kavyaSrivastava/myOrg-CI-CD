@istest
public class A6Q13TC {
    @istest
    public static void meth(){
        Plan_T__c PC = New Plan_T__c();
        pc.Name = 'a';
        pc.TRavel_dis__c = 60;
        Database.SaveResult r = database.insert(pc, false);
        
        Plan_T__c p = new Plan_T__c();
        p.Name = 'b';
        p.TRavel_dis__c = 500;
        Database.SaveResult s = database.insert(p, false);
        
        Plan_T__c pp = new Plan_T__c();
        pp.Name = 'a';
        pp.TRavel_dis__c = 50;
        Database.SaveResult so = database.insert(pp, false);
        
   }

}