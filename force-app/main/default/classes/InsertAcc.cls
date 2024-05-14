public with sharing class InsertAcc {
    @auraEnabled
    public static Account InsertAcc(String name, String web, Date dt,  Boolean c, datetime dtt, String sing, List<String> selctedoption) {
      //  System.debug(name);
      //  System.debug(web);
      //  System.debug(dt);
      //  System.debug(dtt);
      //  System.debug(sing);
       //System.debug(selectedOptions);
      
      
      //, List<String> selectedOptions
      Account acc = new Account();
        acc.Name = name;
        acc.Website = web;
        acc.Datee__c = dt;
     if(c){
        acc.IsActive__c = true;
     }else{
        acc.IsActive__c = false;
     }
        
        acc.Datetimee__c = dtt;
        acc.Single__c	= sing;
        System.debug(selctedoption);
        String str='';
        if(selctedoption.size()>1){
         for(integer i=0;i<selctedoption.size();i++){
             if(i!=selctedoption.size()-1){
             str = selctedoption[i]+';'+str;
             }
             else{
                 str += selctedoption[i];
             }
         }
     }
     if(selctedoption.size()==1){
         str = selctedoption[0];
     }
     System.debug(str);
     acc.Multiselect__c = str;
     
        //acc.Multiselectval__c	= String.Join(selectedOptions,';');
        insert acc;
      //   messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
      //           list<string> address = new list<string>{acc.Website};
      //           mail.setToAddresses(address);
      //           mail.setSubject('Welcome to the world of excitement!!');
      //           mail.setHtmlBody('<p>You have been successfully registered.</p><table><tr><th>Id</th><th>Name</th><th>Booking Date</th><th>Arrival Date And Time</th><th>People</th><th>Ativities</th></tr><tr><td>'+acc.Id+'</td><td>'+acc.Name+'</td><td>'+acc.Datee__c+'</td><td>'+acc.Datetimee__c+'</td><td>'+acc.Single__c+'</td><td>'+acc.Multiselect__c+'</td></tr></table><br><p>Thanks and Regards<br>Cloud Analogy</p>');
      //           messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        return acc;

    }
    @auraEnabled
    public static Contact InsertCon(String name, String web, Date dt,  Boolean c, datetime dtt, String sing, List<String> selctedoption){
      try {
        
         
         Contact con = new Contact();
         con.LastName = name;
         con.Email = web;
         con.Arrival_DateTime__c =dtt;
         con.Booking_Date__c =dt;
         if(c){
            con.Morethanone__c = true;
         }else{
            con.Morethanone__c = false;
         }
         con.Numberofpeople__c = sing;
         String act ='';

         if(selctedoption.size()>1){
            for(integer i=0;i<selctedoption.size();i++){
                if(i!=selctedoption.size()-1){
                  act = selctedoption[i]+';'+act;
                }
                else{
                  act += selctedoption[i];
                }
            }
        }
         con.Activities__c = act;
         insert con;
         // messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
         // list<string> address = new list<string>{con.Email};
         // mail.setToAddresses(address);
         // mail.setSubject('Welcome to the world of excitement!!');
         // mail.setHtmlBody('<p>ou have been successfully registered.</p><table><tr><th>Id</th><th>Name</th><th>Booking Date</th><th>Arrival Date And Time</th><th>People</th><th>Ativities</th></tr><tr><td>'+con.Id+'</td><td>'+con.LastName+'</td><td>'+con.Booking_Date__c+'</td><td>'+con.Arrival_DateTime__c+'</td><td>'+con.Numberofpeople__c+'</td><td>'+con.Activities__c+'</td></tr></table><br><p>Thanks and Regards<br>Cloud Analogy</p>');
         // messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        return con;
         
      } catch (Exception e) {
         throw new AuraHandledException(e.getMessage());
      }
    }
}