public class A6Q10 {
    public static void method1(List<Opportunity> oppl){
     /*   List<Id> opid = new List<Id> ();
        for(opportunity o : oppl){
            opid.add(o.id);
        }*/
        for(Opportunity op:oppl){
           List<OpportunityLineItem> opl = [SELECT ID FROM OpportunityLineItem Where OpportunityId=:op.Id];
            if(opl.size()>2){
                op.addError('this opportunity already have 2 oli');
            }
            
            
        }
        
    }
}