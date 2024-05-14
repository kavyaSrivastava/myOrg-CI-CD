public class Email {
    public static void getcontact(){
       List<User> uList = [SELECT Email FROM User];
        Set<String> mail= new Set<String>();
        for(User u :uList){
            mail.add(u.Email);
        }
        List<Contact> cList = [SELECT Name,Email from Contact where Email In:mail];
        System.debug(cList);
    }
}