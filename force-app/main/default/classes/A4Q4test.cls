@isTest
public class A4Q4test {
	@isTest
    public static void TestdateDiff(){
        System.Test.StartTest();
        Datetime d = A4Q4.dateDiff();
        System.Test.StopTest();
        Datetime expected = Datetime.newInstance(0000,07,09, 01, 40,35);
        System.assertEquals(expected , d);
    }
}