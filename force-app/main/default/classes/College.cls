public virtual class College extends Student {
String collegeName;
Integer year;
    public College(String name, String cn, Integer yr, Integer std){
        this.name=name;
        this.Studentid = std;
        this.collegeName = cn;
        this.year = yr;
    }
    public void display(){
        System.debug('College-'+collegeName );
        System.debug('year'+year);
    }
}