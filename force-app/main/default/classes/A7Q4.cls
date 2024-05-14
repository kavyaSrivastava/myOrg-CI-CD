global class A7Q4 implements Database.Batchable<sObject>{
    global  List<Opportunity> start(Database.BatchableContext bc){
        List<Opportunity> opl = new List<Opportunity>();
        
        for(Integer i = 1;i<=5; i++){
            Opportunity op = new Opportunity();
            op.Name = 'kavya'+i;
            op.StageName = 'Closed Won';
            op.CloseDate = Date.newInstance(2023, 06, 01);
            opl.add(op);
            
        }
        return opl;
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> scope  ){
        try{
            insert scope;
        }
        catch(exception e){
            System.debug(e);
        }
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}