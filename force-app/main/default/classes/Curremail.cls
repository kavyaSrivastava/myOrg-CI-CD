public class Curremail {
      public static String userde(){
            String userEmail = UserInfo.getUserEmail();
           List<Contact> contactList = [SELECT id, Name, Email FROM Contact WHERE email = : userEmail ];
        return (contactList[0].Email);
    
      }
}