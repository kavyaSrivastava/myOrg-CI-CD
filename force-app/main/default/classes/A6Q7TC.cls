@istest
public class A6Q7TC {
  @istest
    public static void meth(){
        Account ac = new Account();
        ac.Name = 'Kavya1';
        insert ac;

        Contact con = new contact();
        con.AccountId = ac.id;
        con.LastName = 'sai';
        insert con;
        
        Opportunity op = new opportunity();
        op.Name ='opptst';
        op.StageName = 'Need Analysis';
        op.AccountId = ac.id;
        op.CloseDate = date.newInstance(2023, 10, 4);
        insert op;

    }
}