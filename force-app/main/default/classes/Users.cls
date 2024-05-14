public class Users {
    public static void userss(){
        List<User> userList = new List<User>();
        userList = [SELECT Name,Phone,email, UserRole.Name,Profile.Name From User];
        for(User us : userList){
            System.debug(us);
          //  System.debug(us.Phone);
            
            //System.debug(us.email);
           
        }
        
    }
}