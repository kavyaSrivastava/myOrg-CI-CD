public class Project1StudentPC {
    public static void meth(List<Uni_Student_Performance__c> usp){
        for(Uni_Student_Performance__c u: usp){
        List<Uni_Course__c> cl =[SELECT ID,NAME, Uni_Professor__c FROM Uni_Course__c WHERE Id =: u.Uni_Course__c];
            if(cl[0].Uni_Professor__c==Null){
                u.addError('Selected course does not have any professor alloted');
            }
            
            }
    }
}