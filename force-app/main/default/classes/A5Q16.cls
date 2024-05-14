public class A5Q16 {
    public static void meth(){
        Date dt = Date.today().addDays(10);
        List<Opportunity> oppl = [SELECT ID,NAME,StageName,Closedate, AccountId from opportunity where closedate=:dt];
        system.debug(oppl);

        List<Contact> conl = [SELECT ID,Name,email,AccountId from Contact where AccountId!=null and email!=null];
        for(opportunity o:oppl){
            for(contact c:conl){
                if(o.AccountId == c.AccountId){
                    List<Messaging.SingleEmailMessage> maill=new list<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage email1 = new Messaging.SingleEmailMessage();
    email1.setSubject('Opportunity Reminder: ' + o.Name);
    email1.setPlainTextBody('The opportunity "' + o.Name + '" for account "' + o.Accountid +
                           '" is due to close on ' + o.CloseDate + '. Please take action as necessary.');
system.debug(c.email);

                    list<String> addd=new list<String>{c.email} ;
system.debug(addd);
        email1.setToAddresses(addd);
        
   maill.add(email1);
                  Messaging.SendEmailResult[]result=  messaging.sendEmail(maill);
                    if(result[0].success){
                        system.debug('success');
                    }
            }
        }
        
        
        
        
    }

}
}