public class Class1 {
    public static void meth(){
        Uni_Course__c c = [SELECT Id,Name,Uni_Professor__c FROM Uni_Course__c WHERE Uni_Professor__c != NULL LIMIT 1];
        System.debug(c);
        list<Uni_Professor__c> pl = [SELECT Id,Name,No_of_courses__c, (SELECT id, name, Uni_Professor__c from courses__r) FROM uni_professor__c WHERE ID =: c.Uni_Professor__c ];
    System.debug(pl);
        System.debug(pl[0].courses__r.size());
    
    }

}