public class A6Q20HC{
        public static void method(list<Contact> conList){
        for(Contact con: conList){
            List<Account> accList= [SELECT ShippingCountry,ShippingCity,ShippingPostalCode,ShippingState,ShippingStreet/*,ShippingLatitude,ShippingLongitude,ShippingGeoCodeAccuracy*/ from Account where id=:con.Accountid];
            
            
            con.MailingCountry = accList[0].ShippingCountry;
            con.MailingCity = accList[0].ShippingCity;
            con.MailingPostalCode = accList[0].ShippingPostalCode;
            con.MailingState = accList[0].ShippingState;
            con.MailingStreet = accList[0].ShippingStreet;
            
			 
        }
        insert conList;
    }

}