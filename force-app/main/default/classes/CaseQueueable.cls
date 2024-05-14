public class CaseQueueable implements Queueable {
    public void execute(QueueableContext context) {
        List<Case> cl =  [Select Id,Status, Origin, Work_Status__c From Case Where Work_Status__c ='Uassigned'];
        insert cl;
    }
}