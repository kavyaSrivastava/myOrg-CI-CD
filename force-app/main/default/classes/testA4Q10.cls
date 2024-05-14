@isTest
public class testA4Q10 {
	@TestSetup
    public static void function(){
        list<Lead> lList=new List<Lead>();
        for(integer i=0;i<21;i++){
    lead l=new Lead();
    l.LastName='new Lead';
    l.Status='Other';
            l.Company='Com';
           
        lList.add(l);
        }
    insert lList;
}
    @isTest
    public static void function2(){
        system.test.startTest();
        A5q10.getUsers();
        system.test.stoptest();
		
        List<Lead> llist=[SELECT LastName,Id from Lead];
        system.assertEquals(21,llist.size());
    }
}