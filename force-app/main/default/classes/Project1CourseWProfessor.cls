public with sharing class Project1CourseWProfessor {
    @AuraEnabled
    public static boolean methodName(){
        
            List<Uni_Course__c> cl = [SELECT Id,Name, Uni_Professor__c FROM Uni_Course__c ];
            for(Uni_Course__c c:cl){
                if(c.Uni_Professor__c ==NUll){
                    return true;
                }
        
            }
            return false;
            
        }
    
}