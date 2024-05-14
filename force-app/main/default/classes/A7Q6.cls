public class A7Q6 {
    PUBlic static void meth(){
        //CronTrigger cr = new CronTrigger();
     List<CronTrigger> cr = [SELECT Id, cronjobdetail.Name FROM crontrigger where cronjobdetail.Name ='My Batch Job' OR cronjobdetail.Name ='a7q4'];
        for(cronTrigger c : cr){
             System.abortJob(c.Id);
                  System.debug('Deleted scheduled job ' + c.CronJobDetail.Name);
        }
       
    }

}