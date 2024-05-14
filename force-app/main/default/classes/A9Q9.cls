public class A9Q9 {
    Public static void meth(){
        List<AggregateResult> casel = [SELECT COUNT(ID) C, AccountID A, Priority p FROM CASE GROUP BY AccountID,Priority];
        list<Account> acclist = [SELECT Id,Highpriority__c, mediumpriority__c from Account ];
         for(Account a: acclist){
                for(AggregateResult c: casel){
                    if(a.Id ==  String.ValueOf(c.get('a')) && String.valueOf(c.get('p'))== 'High'){
                        a.Highpriority__c = String.ValueOf(c.get('c'));
                    }
                    else if(a.Id ==  String.ValueOf(c.get('a')) && String.ValueOf(c.get('p'))== 'Medium'){
                        a.mediumpriority__c = String.ValueOf(c.get('c'));
                    }
                }
            }
        update acclist;
      }
}