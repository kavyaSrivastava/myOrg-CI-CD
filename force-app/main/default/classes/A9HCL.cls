public class A9HCL {
    public static void meth(List<Uni_Course__c> cl){
        for(Uni_Course__c c:cl){
            if(c.Uni_Professor__c!=Null ){
             list<Uni_Professor__c> pl = [SELECT Id,Name,No_of_courses__c, (SELECT id, name, Uni_Professor__c from courses__r) FROM uni_professor__c WHERE ID =: c.Uni_Professor__c ];
                if(pl[0].courses__r.size()<4){
              pl[0].No_of_courses__c = pl[0].courses__r.size();
                update pl;
                }
                else if(pl[0].courses__r.size()>=4){
               c.addError('Already enough courses');
            }
         }
       }
    }

}