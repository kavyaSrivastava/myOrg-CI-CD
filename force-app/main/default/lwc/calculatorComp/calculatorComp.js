import { LightningElement, track } from 'lwc';


export default class CalculatorComp extends LightningElement {
@track a;
@track b;
@track result;
handleChange(event)
{
this.a= event.target.value;

}
handleChange1(event){
this.b= event.target.value;
}
addthem(){
    this.result= parseInt(this.a) + parseInt(this.b);
}
subthem(){
    this.result= parseInt(this.a) - parseInt(this.b);
}
multhem(){
    this.result= parseInt(this.a) * parseInt(this.b);
}
divthem(){
    this.result= parseInt(this.a) / parseInt(this.b);
}
}