public class Project1ClassCourse {
    public static void meth(List<Uni_Course__c> cl){
        for(Uni_Course__c co:cl){
            if(co.End_Date__c == System.Today().addDays(2)){
               
              //  List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
               List<Uni_Professor__c> pl =[SELECT Name, Email__c FRom Uni_Professor__c where Id=: co.Uni_Professor__c];
                String[] toaddress = new String[]{pl[0].Email__c};
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Course completion date is near');
        mail.sethtmlbody('The course'+co.Name+'number has to be updated');
        mail.setToAddresses(toaddress);
    
                Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        
           
        }
        }
    }
}