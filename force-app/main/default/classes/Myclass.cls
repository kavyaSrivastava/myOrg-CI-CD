public class Myclass {
 private Integer var1= 10;
    public void fun1(){
        Integer var1 =15;
        System.debug('Local Value');
        System.debug(var1);
        System.debug('Class Value');
        System.debug(this.var1);
    }
}