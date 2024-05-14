public class BST1Q9 {
    public static void meth(List<Appointment__c> appl){
        for(Appointment__c a: appl){
            List<Appointment__c> appd = [select id from appointment__c where AppointmentDate__c =: a.AppointmentDate__c AND Doctor__c =:a.Doctor__c];
            if(appd.size()>8){
                a.addError('drr');
            }
            List<Appointment__c> appp = [select id from appointment__c where AppointmentDate__c =: a.AppointmentDate__c AND Paitent__c =:a.Paitent__c];
            if(appp.size()>=2){
                a.addError('prr');
            }
        }
    }
}