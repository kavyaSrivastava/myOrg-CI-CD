public class A9HC {
    public static void meth(List<Uni_Professor__c> ppl){
      
        for(Uni_Professor__c p:ppl){
            list<Uni_Professor__c> pl = [SELECT Id,Name, (SELECT id, name from courses__r) FROM uni_professor__c  ];
            if(p.courses__r.size()>4){
            p.adderror('Already have enough courses');
        }
        
        }
    }
}