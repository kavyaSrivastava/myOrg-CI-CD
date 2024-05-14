public class Createauser {
        
    public static void CreateAdmin(){
        Profile proID=new Profile();
        proID=[SELECT id from Profile where Name='System Administrator' limit 1 ];
        User usrs=new User();
        usrs.Alias='Alias1';
        usrs.LastName='Lastname';
        usrs.email='kavya.srivastava@cloudanalogy.com';
        usrs.username='kavya@gmail.com';
        //usrs.UserRoleId='Developer';
        usrs.ProfileId = proID.id;
        usrs.EmailEncodingKey='UTF-8';
        usrs.LocaleSidKey='en_US';
        usrs.TimeZoneSidKey='GMT';
        usrs.LanguageLocaleKey='en_US';
         
        insert usrs;
        
        
        
    }
}