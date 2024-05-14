global class A7Q12 implements database.batchable<sobject> {
    global List<Lead> start(database.BatchableContext bc){
        List<Lead> l = [SELECT Id from lead where Phone= Null AND CreatedDate = LAST_N_Days:1];
        return l;
    }
    global void execute(database.BatchableContext bc,LIst<Lead> scope){
        String[] email = new string[] {userinfo.getUserEmail()};
        String mailbody = 'detail of leads not having phone number' + scope;
        Messaging.SingleEmailMessage m = new Messaging.SingleEmailMessage();
        m.setSubject('Cloud Analogy');
        m.setPlainTextBody(mailbody);
        m.setToAddresses(email);
        messaging.sendEmail(new Messaging.SingleEmailMessage[] {m});
        
        
}
    global void finish(database.BatchableContext bc){   
    }
    

}