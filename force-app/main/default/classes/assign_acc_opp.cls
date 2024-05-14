public class assign_acc_opp {
public static void assignmethod()
{
    List<Account> acclist=[SELECT Name,(SELECT Name,StageName,closeDate from Opportunities) from Account];
    List<Account> alist=new List<Account>();
    for(Account acc:acclist)
    {
        Integer size=0;
        for(Opportunity opp:acc.Opportunities)
        {
            //size=acc.Opportunities.size();
            if((acc.opportunities.size()>=10))
            {
                if((opp.StageName=='Closed Won'))
                {
                        alist.add(acc);
                }
                
            }
        }
      }
    for(Account a:alist)
    System.debug(a.Name);
}
}