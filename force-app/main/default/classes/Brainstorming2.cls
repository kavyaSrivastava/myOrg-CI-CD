public class Brainstorming2 {
    @AuraEnabled
   public static String assignCase(List<Case> cl){
        for(Case c:cl){
           Agent__c a = [SELECT ID, Name,Current_Work__c, Free_Slot__c,Email__c From Agent__c Order By Free_Slot__c DESC Limit 1];
        if(a.Free_Slot__c>0){
            c.AgentId__c = a.Id;
            a.Current_Work__c = a.Current_Work__c+1;
            c.Work_Status__c = 'Assigned';
            update a;
            String[] toaddress = new String[] {a.Email__c};
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('New Case Assigned');
        mail.sethtmlbody('New Case'+c.Id+'has been assigned to you');
        mail.setToAddresses(toaddress);
    
                Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
           return '1';
        }  
            else{
                c.Work_Status__c= 'Unassigned';
                return '0';
            }
            
        }
    //    @AuraEnabled
    //    public static boolean methodName(){
    //     try {
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
        //}
        return '0';
       }
        
        
        
    }