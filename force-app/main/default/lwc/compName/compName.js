import { LightningElement, track} from 'lwc';

export default class CompName extends LightningElement {
  //  name = "kavya";
    @track name= "Kavya"
    

handleClick(){
    this.name = "xyz";
}

    
}