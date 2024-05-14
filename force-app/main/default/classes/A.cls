public class A {
    public static void meth(){
        GoogleApiInt__c c = GoogleApiInt__c.getOrgDefaults();
        time dt=System.now().time();
        time t=c.LastModifiedDate.time();
       System.debug(System.now().time());
            System.debug(c.LastModifiedDate.time());
        
        
    }

}