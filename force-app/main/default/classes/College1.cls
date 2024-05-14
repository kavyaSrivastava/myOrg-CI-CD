public virtual class College1 extends Student {

String collegeName;
Integer year;
    public College1(String name, String cn, Integer yr, Integer std){
        this.name=name;
        this.year = yr;
        this.Studentid = std;
        this.collegeName = cn;

    }
    public void display1(){
        System.debug('College-'+collegeName );
        System.debug('year'+this.year);
        System.debug(this.Studentid);
        System.debug(this.name);
    }
}
//Teacher tec = new Teacher(2000,'math', 123450, 'sri');
//tec.display();
//    College col = new College('kav', 'srm', 12, 3);
//col.display1();