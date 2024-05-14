public class A5Q12{
    public static void meth(){
        List<Aggregateresult> accl = [SELECT COUNT(ID) cd,owner.name  FROM Account GROUP BY owner.name];
        List<Aggregateresult> conl = [SELECT COUNT(ID) cond,owner.name FROM Contact GROUP BY owner.name];
        SET<String> userset = new set<String>();
        for(Aggregateresult ac:accl){
            for(Aggregateresult con:conl){
                if(string.valueof(ac.get('Name'))==string.valueof(con.get('Name'))){
                    Integer i = integer.valueof(ac.get('cd'));
                    Integer j = integer.valueof(con.get('cond'));

                if(i>50 && j>30 ){
                userset.add(string.valueof(ac.get('name')));
                 }
                }
              }
                
            }
        
         list<User> Emailll=[SELECT Email from user where name=: userset];
        //System.debug(emailll);
         List<String> address = new List<String>();
        for(user u:Emailll){
            address.add(u.email);
        }
        
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
       
            
       	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('HIC Global Solutions');
        mail.setplaintextbody('Welcome to HIC Global Solutions');
        mail.setToAddresses(address);
        emailList.add(mail);
           if(!emailList.isEmpty()){
            Messaging.sendEmail(emailList);
        }
      }
}