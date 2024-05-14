@isTest
public class ReverseOrderTest {
    @TestSetup 
    public static void reversesetup(){
        Account ac=new Account();
        ac.name='Cloud Analogy';
        insert ac;
   }
    @isTest
    public static void testreverse(){
       
        list<String> AccList=ReverseOrder.ro();
        for(integer i=0;i<AccList.size();i++){
          
                    system.assertEquals('ygolanA duolC', AccList[i]);
            }
      }
}