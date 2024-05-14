public class Pattern {
    public static void pat(Integer n){
    for(Integer i=1;i<=5;i++){
        String s= '';
        for(Integer j=1;j<=i;j++){
            s=s+'*';
        }
        System.debug(s);
    }
    }
}