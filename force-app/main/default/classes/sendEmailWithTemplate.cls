public class sendEmailWithTemplate {
    public static void sendEmail(){
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemp = [SELECT Id, Subject, Body FROM EmailTemplate WHERE Name = 'templates24'];
        Contact con =  [SELECT Id, Name FROM Contact where LastName = 'Rana'];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTemplateId(emailTemp.Id);
        mail.setTargetObjectId(con.Id);
        mailList.add(mail);
        if(!mailList.isEmpty()){
            Messaging.sendEmail(mailList);
        }
  }

}