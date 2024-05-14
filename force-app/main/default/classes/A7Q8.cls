global class A7Q8 implements schedulable {
    global void execute(System.SchedulableContext sc){
        A7Q7 q = new A7Q7();
        id jobid = database.executeBatch(q);
    }

}