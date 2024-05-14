@istest
public class A6Q12TC {
    @istest
    public static void main(){
        Opportunity op = new Opportunity();
        op.Name = 'Opptest';
        op.StageName = 'Closed Lost';
        op.CloseDate = Date.newInstance(2023, 03, 22);
       
        insert op;
     }

}