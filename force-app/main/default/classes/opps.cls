public class opps {
    public static void opps5(){
        
    
list<Contact> conList=[SELECT aCCOUNTID FROm CONTACt WHERE ACCOUNTID!=NULL limit 1];
       
        list<opportunity> acclist=new list<opportunity>();
        for(integer i=0;i<5;i++){
            opportunity ac= new opportunity();
            ac.Name='ooopppooola'+i;
            ac.closeDate=system.today();
            ac.stageName='Closed Won';
            ac.AccountId=conlist[0].accountid;
            acclist.add(ac);
        }
        insert accList;
    }
}