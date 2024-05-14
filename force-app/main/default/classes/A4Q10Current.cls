//Write a program to display current salesforce users detail like Name, Number and userid.
public class A4Q10Current {
  public static List<User> salesforce(){
 // public static void salesforce(){
        //List<User> us = [SELECT Name,Email,Id FROM User];
        // System.debug(us);
        id userId = userInfo.getUserId();
        //gives id of current user
       List<User> u = [SELECT Id, Name, Email FROM USER WHERE Id = :userId];
       // System.debug(u[0].Name);
        //System.debug(u.Email);
      //System.debug(u.Phone);
     return u;
    }
}