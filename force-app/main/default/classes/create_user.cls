public class create_user {
public static void usercreation()
{
    //Profile prfl=new Profile();
    Profile prf=[SELECT Id from Profile where Name='System Administrator' LIMIT 1];
    User usrs=new User();
    usrs.Alias='xyz1';
    usrs.LastName='xyxyx';
    usrs.email='kavya.srivastava@cloudanalogy.com';
    usrs.username='xyzzzz@gmail.com';
    usrs.CommunityNickname='nickx';
    usrs.UserRoleId=Null;
    usrs.ProfileId=prf.Id;
    usrs.EmailEncodingKey='UTF-8';
    usrs.LocaleSidKey='en_US';
    usrs.TimeZoneSidKey='GMT';
    usrs.LanguageLocaleKey='en_US';
    insert usrs;
}
}