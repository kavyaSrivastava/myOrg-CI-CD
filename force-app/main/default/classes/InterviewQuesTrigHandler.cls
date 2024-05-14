public class InterviewQuesTrigHandler {
    public static void handleMeth(List<Invoice__c> newinvoicelist){
       // try{
                    Set<Id> invoiesacc = new Set<Id>();
        Date dt = system.today();
        
        for(invoice__c inv : newinvoicelist){
            invoiesacc.add(inv.Account__c);
        }
            system.debug(invoiesacc);
        List<Account> acc= [SELECT Name, Approval_Status__c from Account where id in: invoiesacc];
        List<Account> updatedList =new List<Account>();
        
          List<AggregateResult> outstandingbalance= [select Sum(Amount__c) s,Account__c from invoice__c Where invoice_status__C ='Unpaid' AND Account__c In: invoiesacc Group by Account__c];
           system.debug(outstandingbalance);
          List<AggregateResult> opplist= [Select Count(id) c, Accountid from opportunity where Accountid IN: invoiesacc And stageName = 'Closed Won' Group by Accountid];
       
          List<AggregateResult> camplist = [Select Avg(Campaign_Success_Rate__c) a, Account__c from campaign where Account__c In: invoiesacc group by account__c] ; 
            
          List<AggregateResult> dueinvoice = [Select count(Id) n,Account__c from Invoice__c where Invoice_Due_Date__c <: dt And Account__c In: invoiesacc group by account__c];
                       system.debug(dueinvoice);

        for(Account a: acc){
            //for(invoice__c inv: newinvoicelist){
                //if(inv.Account__c == a.id){
                    for(AggregateResult out:outstandingbalance ){
                if(a.id == String.valueOf(out.get('Account__c'))){
                     for(AggregateResult oppl: opplist){
                         if(String.valueOf(oppl.get('AccountId')) == String.valueOf(out.get('Account__c'))){
                             for(AggregateResult campl:camplist){
                                 if(String.valueOf(campl.get('Account__c'))==String.valueOf(oppl.get('AccountId'))){
                                    for(AggregateResult due:dueinvoice){
                                       // if(inv.Account__c == due.get('Account__c')){
                                        if(String.valueOf(due.get('Account__c'))==a.id){
                                            if(Integer.valueOf(due.get('n')) <= 1 && Integer.valueOf(campl.get('a')) >=50 && Integer.ValueOf(oppl.get('c')) >= 2 && integer.valueOf(out.get('s')) <= 45000) {
                                                a.Approval_Status__c = 'Approved';
                                                updatedList.add(a);
                                            }
                                             else{
                                                  a.Approval_Status__c = 'Required Review';
                                                 updatedList.add(a);
                                               }
                                            
                                        }
                                        }  
                                    }
                       
                               } 
                         }
                   
                      }
                 }
            
             }
          }
             if(!updatedList.Isempty()){
            update(updatedList);
            system.debug(updatedList);
        }
        
        //}
       
           
   
       /* catch(Exception e){
             System.debug('Something went wrong');
        }*/
                  //Account acc=new Account(name='new acc');
/*insert acc;
campaign cam=new campaign();
cam.account__c=acc.id;
cam.Campaign_Success_Rate__c=65;
cam.Name='new cam';
insert cam;
Opportunity Opp=new opportunity();
Opp.closeDate=date.today();
Opp.StageName='Closed Won';
Opp.Name='new op';
Opp.AccountId=acc.id;
insert Opp;
Opportunity Opp1=new opportunity();
Opp1.closeDate=date.today();
Opp1.StageName='Closed Won';
Opp1.Name='new op1';
Opp1.AccountId=acc.id;
insert Opp1;
Invoice__c in1=new Invoice__c();
in1.account__c=acc.id;
in1.amount__c=50000;
in1.Invoice_Due_Date__c=date.today().addDays(-1);
in1.Invoice_status__c='Unpaid';
insert in1;
list<Invoice__c> inList=new list<Invoice__c>{in1};
InterviewQuesTrigHandler.handleMeth(inList);    
*/
               
  }
}