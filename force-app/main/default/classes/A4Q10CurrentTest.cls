@isTest
public class A4Q10CurrentTest {
    @isTest
    public static void testclass(){
        List<User> z = A4Q10Current.salesforce();
        System.assertEquals('Kavya Srivastava', z[0].Name);
    }

}