public class Project1StudentC {
    public static void meth(List<Uni_Students__c> sl){
      List<Uni_Course__c> cs = [SELECT ID,Name from Uni_Course__c LImit 1 ];
        for(Uni_Students__c s: sl){
            Uni_Student_Performance__c sp = new Uni_Student_Performance__c();
            sp.Studentsuni__c = s.Id;
            sp.Uni_Course__c = cs[0].Id;
            sp.Name= s.Name + 'DEFAULT';
            insert sp;
        }
    }
}