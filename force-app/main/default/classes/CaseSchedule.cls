global class CaseSchedule implements schedulable{
    global  void execute(System.SchedulableContext sc){
        CaseQueueable obj = new CaseQueueable();
      ID jobID = System.enqueueJob(obj);
       
    }

}