public class Deletesml {
    public static void statement(){
        List<Contact> conList = [SELECT AccountId FROM Contact where Account.Name Like 'z%'];
        delete conList;
    }
}