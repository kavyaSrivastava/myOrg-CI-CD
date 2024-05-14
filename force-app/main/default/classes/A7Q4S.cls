GLOBAL class A7Q4S implements schedulable{
    global void execute(System.SchedulableContext sc){
        A7Q4 s = new A7Q4();
        id scid = database.executeBatch(s);
    }

}