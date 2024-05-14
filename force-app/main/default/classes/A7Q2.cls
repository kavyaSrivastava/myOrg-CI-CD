global class A7Q2 implements schedulable{
    global  void execute(System.SchedulableContext sc){
        A7Q1 obj = new A7Q1();
        Id BatchId = database.executeBatch(obj);
    }

}