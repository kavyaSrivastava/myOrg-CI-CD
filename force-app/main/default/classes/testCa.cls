@istest
public class testCa {
@istest
        public static void tmethod(){
            System.test.startTest();
            Cases.cases1();
           System.test.stopTest();
            List<Case> cset = [SELECT ID,status FROM Case WHERE status='New22'];
            System.assertEquals(5, cset.size());
            
        }
    }