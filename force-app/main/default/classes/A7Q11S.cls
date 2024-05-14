global class A7Q11S implements Schedulable {
    global void execute(System.SchedulableContext sc){
        A7Q11 ss = new A7Q11();
        id jobid = database.executeBatch(ss);
    }

}