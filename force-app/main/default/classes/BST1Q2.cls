public class BST1Q2 {
    public static void meth(List<Opportunity> oppl){
        for(Opportunity op: oppl){
            if(op.Amount >50){
                Account acc =[select id,owner.email,name from Account where id =: op.AccountId];
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        String[] toaddress=new String[]{acc.Owner.Email};
            email.setToAddresses(toaddress);
           String sub='your opportunity amount is greater than 50';
            email.setSubject(sub);
            String body='Hi'+acc.Name +' '+ 'Your Account Limit is exceeded more than 50 thats why this email is send this to u';
            email.setHtmlBody(body);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
            }
        }
    }
}