public class A6Q11 {
    public static void method1(List<Account> accl){
        for(Account a : accl){
            if(a.NumberofEmployees >100){
                Contact c = new Contact();
                c.LastName = 'Srivas';
                c.AccountId = a.Id;
                Insert c;
                
                Case cs = new Case();
                cs.AccountId = a.Id;
                cs.ContactId = c.Id;
                cs.Status ='New';
                cs.Origin = 'Web';
                insert cs;
                
                
                Opportunity op = new Opportunity();
                op.AccountId= a.Id;
                op.CloseDate= Date.newInstance(2023, 12, 11);
                op.StageName = 'Closed Won';
                op.Name = 'triggeropp';
                insert op;
                
                Opportunitycontactrole ocr = new OpportunityContactRole();
                ocr.ContactId = c.Id;
                ocr.OpportunityId =op.Id;
                 ocr.IsPrimary=true;
                ocr.Role='Decision Maker';
                insert ocr;
    
            } 
        }
    }
}