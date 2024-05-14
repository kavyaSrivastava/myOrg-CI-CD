public class A7Q3{
    
    public static void delJobs(){
        cronTrigger ct = [SELECT Id,cronjobdetail.Name From CronTRigger WHERE cronjobdetail.Name = 'ss'];
        System.abortjob(ct.Id);
    }

}