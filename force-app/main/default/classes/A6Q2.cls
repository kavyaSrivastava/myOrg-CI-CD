public class A6Q2 {
    public static void opclosedate(List<Opportunity> opl){
        for(Opportunity op: opl){
            if(op.CloseDate < Date.today()){
                op.addError('Please enter a future close date');
            }
        }
    }

}