public with sharing class GetUserPic {
    // @AuraEnabled
    // public static sObject getProfilePic(){

    //     try {
    //          sObject u = [SELECT SmallPhotoUrl, Name, Email, Phone, AboutMe, Country, Street, State, CompanyName FROM User WHERE ID =: UserInfo.getUserId()];
    //          return u;
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
    @AuraEnabled
    public static void insertUser(String p, String countryn, String companyn, String namen){
        try {
            User u = new User();
            u.Id = UserInfo.getUserId();
            u.Phone = p;
            u.Country = countryn;
            u.CompanyName = companyn;
            
            update u;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static sObject getProfilePic(){
        try {
            String query ='SELECT ';
            // for(sCHEMA.fIELDsETmEMBER F : soBJECTtYPE.User.FieldSets.User_Field_Set.getFields()){
                for(Schema.FieldSetMember  f : SObjectType.User.FieldSets.User_Field_Set.getFields()){
                query += f.getFieldPath() + ', ';
            }
            Id usId =UserInfo.getUserId();
            query += 'Id, SmallPhotoUrl From  User where ID =: usId';
            return Database.query(query);

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
}