global class A7Q11 implements database.Batchable<sObject> {
    
global List<lead> start(Database.BatchableContext bc)
{
    List<lead> ll = [SELECT Id FROM Lead WHERE Phone!= NULL AND CreatedDate = LAST_N_Days:1];
    return ll;
}
    global void execute (Database.BatchableContext bc, List<Lead> scope){
        for(Lead l : scope){
            try{
                System.debug(l);
            }
            catch(Exception e){
                System.debug(e);
            }
        }
    }
    global void finish(Database.BatchableContext bc){
        
    }

}