public virtual class Teacher extends Person {
    public Long salary;
   public String subject;
    public Teacher(Long sal, String subjec,Integer dote,String name){
        this.dob = dote;
        this.name = name;
        
        this.salary = sal;
        this.subject = subjec;
    }
    public void display(){
    System.debug(dob );
        System.debug(name);
        System.debug(salary);
        System.debug(subject);}
}