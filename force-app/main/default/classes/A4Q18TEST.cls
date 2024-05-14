@istest
public class A4Q18TEST {
    @testsetup
    public static void meth(){
        Profile prf=[SELECT Id from Profile where Name='System Administrator' LIMIT 1];
    }
    @istest
    public static void meth1(){
        test.starttest();
        create_user.usercreation();
        test.stoptest();
        profile p =[select id from profile where Name='System Administrator' LIMIT 1]; 
        List<user> u = [select id,Lastname from user where ProfileId =: p.id];
        System.assertEquals(u.size(), 1);
    }
}