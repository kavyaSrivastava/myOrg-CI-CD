import { LightningElement, track } from 'lwc';
import { Flow } from 'lightning/flowSupport';
import { getListUi } from 'lightning/uiListApi';
// import TIME_SLOT_OBJECT from '@salesforce/schema/TimeSlot__c';
import getSlots from "@salesforce/apex/getTimeSlots.getSlots";


export default class FetchQParamFromUrl extends LightningElement {
    pageUrl
    queryParams;
    operatingHourId;

    timeSlots;
    connectedCallback(){
        this.pageUrl = window.location.href;
        console.log('Page URL:', this.pageUrl);

        const urlParams = new URLSearchParams(window.location.search);
        console.log('line', urlParams);
        this.operatingHourId = urlParams.get('operatingHourId');
        console.log('line 12', this.operatingHourId);


        getSlots
        ({
            operatingHoursId: this.operatingHourId
        })
        .then((result) => {
            this.timeSlots = result;
            console.log('line 26-', JSON.stringify(result));
            this.populateDayOptions();
        })
        .catch((error) => {
            console.log('In connected call back error....');
            this.error = error;
            console.log('Error is', this.error);
        });

        

    }

    @track dayOptions = [];
    @track selectedDay;
    @track getTimeSlotsForSelectedDay = [];
    populateDayOptions() {
        // Assuming timeSlots is a list of maps with 'DayOfWeek' as a key
        const uniqueDays = [...new Set(this.timeSlots.map(slot => slot.DayOfWeek))];
        const sortedDays = uniqueDays.sort((a, b) => this.sortDays(a, b));
        this.dayOptions = sortedDays.map(day => ({ label: day, value: day }));
        // this.dayOptions = uniqueDays.map(day => ({ label: day, value: day }));
        console.log('line 42', JSON.stringify(this.dayOptions));
    }

    sortDays(day1, day2) {
        const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        return daysOfWeek.indexOf(day1) - daysOfWeek.indexOf(day2);
    }

    handleDayChange(event) {
        this.selectedDay = event.detail.value;
        this.getTimeSlotsForSelectedDay = this.timeSlots.filter(slot => slot.DayOfWeek === this.selectedDay);
    }

    // @track selectedDate;
    // @track selectedResource;
    // @track dateOptions = []; // Populate with available dates
    // @track resourceOptions = []; // Populate with available resources
    // @track timeSlots = [];

    // // Implement logic to populate date and resource options

    // handleDateChange(event) {
    //     this.selectedDate = event.detail.value;
    // }

    // handleResourceChange(event) {
    //     this.selectedResource = event.detail.value;
    // }

    // getTimeSlots() {
    //     // Implement logic to query and retrieve time slots based on selected date and resource
    //     // Use Apex to query FSL objects (e.g., TimeSlot__c) based on selectedDate and selectedResource
    //     // Update this.timeSlots with the retrieved time slots
    // }
}