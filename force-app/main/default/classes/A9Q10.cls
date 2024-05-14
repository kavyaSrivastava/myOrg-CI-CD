public class A9Q10 {
    Public static void meth(){
        List<Case> caseList = [SELECT Id, OwnerId,CreatedDate FROM Case WHERE CreatedDate = Last_N_Days:30];
        List<Task> taskList = new List<Task>();
        for(Case c: CaseList){
            Task t = new Task();
            t.OwnerId = c.OwnerId;
            t.Subject ='Email';
            t.Priority= 'Normal';
            t.Status= 'Not Started';
            t.ActivityDate = Date.ValueOf(c.CreatedDate.addDays(5));
            taskList.add(t);
        }
        insert taskList;
       
    }

}