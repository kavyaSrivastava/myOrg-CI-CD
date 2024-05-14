@istest
public class A6Q19TC {
    @istest
    public static void meth(){
    
        List<Lead> lList= new List<Lead> ();
        for(integer i=1;i<=30;i++){
            Lead l= new Lead();
            l.LastName='LeadTest'+i;
            l.Company='CA';
            l.Status='Closed Converted';
            //l.CreatedDate=date.newInstance(2023, 03, i);
            l.OwnerId= userinfo.getUserId();
            lList.add(l);
        }
        insert lList;
        
        Lead l= new Lead();
        l.lASTName='LeadTest';
        l.Company='CA';
        l.Status='Closed Converted';
        l.OwnerId= userinfo.getUserId();
        //l.CreatedDate=date.newInstance(2023, 03, 4);
        system.test.startTest();
        database.SaveResult r= database.insert(l,false);
        system.test.stopTest();
        
        system.assert(!r.isSuccess());
    }


}