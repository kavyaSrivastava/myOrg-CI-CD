import { LightningElement, track } from 'lwc';
import CloudAnalogy from '@salesforce/resourceUrl/CloudAnalogyLogo';
// import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
// import { CurrentPageReference } from 'lightning/navigation';
// import USER_OBJECT from '@salesforce/schema/User';
// import USER_PICTURE_FIELD from '@salesforce/schema/User.SmallPhotoUrl';
import getUserPic from '@salesforce/apex/GetUserPic.getProfilePic' ;

// const FIELDS = [USER_PICTURE_FIELD];
 

export default class HeaderComp extends LightningElement {

 @track companyLogoUrl = CloudAnalogy;
 
 @track profilePictureUrl
 @track name;
 @track err;
 @track handleCLick;
 @track currentusermail;
 @track currentUsserPhone;
 @track company;
 isvisible = false;

connectedCallback(){
    this.fetchUserData();
}
  handleImageClick() {
    // Handle the click event here
     window.open('https://www.cloudanalogy.com','_blank');
  }
fetchUserData(){
    getUserPic()
        .then(result => {
            this.profilePictureUrl = result.SmallPhotoUrl;
            this.name = result.Name;
            this.currentusermail = result.Email;
            this.currentUsserPhone = result.Phone;
            this.company = result.CompanyName;

            this.error = undefined;
    
        })
        .catch(error =>{
            this.error = error;
            
        })
      
}
  
handleclick(){
    if(this.isvisible==false){
        this.isvisible = true;
    }
    else {
        this.isvisible = false;
    }
    
} 

 
// @wire(getUserInfo, { fields: FIELDS })
//     userData({ error, data }) {
//         if (data) {
//             const user = data;
//             const profilePictureUrl = user && user.User ? user.User.SmallPhotoUrl : null;
//             // Use the profilePictureUrl in the template or perform additional logic
//         } else if (error) {
//             // Handle any error that occurred during the wire request
//             this.errr = error;
//             console.log(this.errr);
//         }
//     }

}