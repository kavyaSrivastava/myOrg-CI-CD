import { LightningElement, track } from 'lwc';
import bgimage from '@salesforce/resourceUrl/CloudAnalogyLogo';
import getUserPic from '@salesforce/apex/GetUserPic.getProfilePic' ;


export default class ProfileComp extends LightningElement {

    @track profilePic
    @track currentusername;
    @track currentusermailid;
    @track currentUsserPhonenumb;
    @track currentuserscompany;
    @track currentuserstate;
    @track currentusercountry;  
    @track cureentuseraboutme;



    imageUrl = bgimage;
    connectedCallback(){
        this.fetchUserData();
    }
    fetchUserData(){
        getUserPic()
            .then(result => {
                this.profilePic = result.SmallPhotoUrl;
                this.currentusername = result.Name;
                console.log("res ===>" + JSON.stringify(result));
                this.currentusermailid = result.Email;
                this.currentUsserPhonenumb = result.Phone;
                this.currentuserscompany = result.CompanyName;
                this.currentuserstate = result.State;
                this.currentusercountry = result.Country;
                this.cureentuseraboutme = result.AboutMe;
    
                this.error = undefined;
        
            })
            .catch(error =>{
                this.error = error;
                
            })
          
    }
   get getBackgroundImage(){
    return `background-image:url("${this.imageUrl}")`;
} 
}