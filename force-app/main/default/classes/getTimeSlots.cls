public with sharing class getTimeSlots {
    // @AuraEnabled
    // public static void getWorkOrderDetails(){
    //     try {
            
    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
    // @AuraEnabled(cacheable=true)
    // public static WorkOrderDataWrapper getWorkOrderDetails(String workOrderId) {
    //     WorkOrder wo = [SELECT Id, Subject, Description, Work_Type FROM WorkOrder WHERE Id = :workOrderId LIMIT 1];

    //     if (wo != null) {
    //         List<ServiceAppointmentDataWrapper> serviceAppointments = getServiceAppointments(workOrderId);
    //         return new WorkOrderDataWrapper(wo.Id, wo.Subject, wo.Description, wo.Work_Type, serviceAppointments);
    //     } else {
    //         return null;
    //     }
    // }

    // private static List<ServiceAppointmentDataWrapper> getServiceAppointments(String workOrderId) {
    //     List<ServiceAppointment> appointments = [SELECT Id, ScheduledStart, ScheduledEnd FROM ServiceAppointment WHERE WorkOrder.Id = :workOrderId];

    //     List<ServiceAppointmentDataWrapper> appointmentWrappers = new List<ServiceAppointmentDataWrapper>();
    //     for (ServiceAppointment sa : appointments) {
    //         appointmentWrappers.add(new ServiceAppointmentDataWrapper(sa.Id, String.valueOf(sa.ScheduledStart), String.valueOf(sa.ScheduledEnd)));
    //     }

    //     return appointmentWrappers;
    // }

    // @AuraEnabled
    // public static List<slots> getSlotsFromTeritory(Id appointmentId){
    //     try{
    //         List<FSL__Scheduling_Policy__c> policies = [SELECT Id, Name FROM FSL__Scheduling_Policy__c WHERE Name = 'Soft Boundaries'];
    //         // if (policies == null || policies.size() == 0) {
    //         //     throw new HomewaterException('No Scheduling policy is defined');
    //         // }
            
    //         Id schedulingPolicyId = policies[0].Id;
    //         system.debug('scheduled policy ' + schedulingPolicyId);
            
    //         OperatingHours abOperatingHours = [SELECT Name, Id,timezone, (SELECT EndTime, StartTime, Type, DayOfWeek FROM TimeSlots) 
    //                                              FROM OperatingHours WHERE Name = 'Availability Hours' limit 1];
    //         system.debug('before  1' + abOperatingHours);
    //         system.debug('before  2' + appointmentId +'          '+ TimeZone.getTimeZone(abOperatingHours.TimeZone));


    //         TimeZone tz = TimeZone.getTimeZone(abOperatingHours.TimeZone);
    //         system.debug('line 51'+ tz);
    //         List<FSL.AppointmentBookingSlot> slots =  FSL.AppointmentBookingService.GetSlots(appointmentId, 
    //                                                       schedulingPolicyId, 
    //                                                       abOperatingHours, 
    //                                                       tz,
    //                                                       'SORT_BY_DATE', false);
           
    //         system.debug('after '+slots.size());
    //         map<string,List<appts>> mapOfDateToSlots = new map<string,List<appts>>();
    //         List<slots> slotsList = new List<slots>();
    //         // TimeZone tz = TimeZone.getTimeZone(abOperatingHours.TimeZone);
    //         for(integer i=0; i<slots.size(); i++){
    //             DateTime startTime = DateTime.newInstanceGMT(slots[i].interval.start.yearGMT(), slots[i].interval.start.monthGMT(), slots[i].interval.start.dayGMT(),slots[i].interval.start.hourGMT(),slots[i].interval.start.minuteGmt(), 0); 
    //             String startconverted = startTime.formatGMT('MM/dd/yyyy h:mm a');
    //             String realstart = startTime.format('MM/dd/yyyy');
                
    //             DateTime endTime = DateTime.newInstanceGMT(slots[i].interval.Finish.yearGMT(), slots[i].interval.Finish.monthGMT(), slots[i].interval.Finish.dayGMT(), slots[i].interval.Finish.hourGMT(), slots[i].interval.Finish.minuteGmt(), 0);
    //              String endconverted = endTime.formatGMT('MM/dd/yyyy h:mm a');
    //             String realend = endTime.format('MM/dd/yyyy');
    //             appts newslot = new appts();
    //             newslot.slotId = slots[i].interval.start +'^'+  slots[i].interval.Finish;
    //             newslot.start = startconverted.substring(11,startconverted.length());//slots[i].interval.start.format('h a',String.valueOf(TimeZone.getTimeZone(abOperatingHours.TimeZone)));//string.valueOf(realstart.hour() < 10?'0'+realstart.hour():'' + realstart.hour())+':'+string.valueOf(realstart.minute() < 10?'0'+ realstart.minute():'' + realstart.minute());
    //             newslot.endtime= endconverted.substring(11,endconverted .length());
    //             if(mapOfDateToSlots.containsKey(realstart)){
    //                 mapOfDateToSlots.get(realstart).add(newslot);
    //             }else{
    //                 mapOfDateToSlots.put(realstart,new List<appts>{newslot});
    //             }                
    //         }   
            
    //         for(String each :mapOfDateToSlots.keyset()){
    //             slots tempslots = new slots(); tempslots.startDate = each; tempslots.apptList = mapOfDateToSlots.get(each); slotsList.add(tempslots); 
    //         } 
    //         return slotsList;
    //     }
    //     catch(Exception ex){
    //         system.debug('catch '+ex.getLineNumber()+' '+ex.getMessage()+' '+ex.getCause());
    //         return null;
    //     }
    // }


    // public static List<TimeSlot> getTimeSlots(String appointmentId) {
    //     List<TimeSlot> timeSlots = new List<TimeSlot>();
        
    //     // Retrieve the ServiceAppointment record
    //     ServiceAppointment serviceAppointment = [SELECT Id, ServiceResourceId FROM ServiceAppointment WHERE Id = :appointmentId LIMIT 1];

    //     if (serviceAppointment != null) {
    //         // Retrieve the time slots related to the Service Resource
    //         List<TimeSlot> allTimeSlots = [SELECT Id, StartTime, EndTime 
    //                                        FROM TimeSlot 
    //                                        WHERE ServiceResourceId = :serviceAppointment.ServiceResourceId];

    //         // Filter time slots based on your logic (if needed)
    //         // For example, you might want to filter time slots that are in the future or within a specific date range.

    //         // Add the filtered time slots to the result list
    //         for (TimeSlot ts : allTimeSlots) {
    //             timeSlots.add(ts);
    //         }
    //     }

    //     system.debug('line 114'+timeSlots);
    //     return timeSlots;
    // }

    // public static List<String> getOperatingHours(String serviceAppointmentId) {
    //     List<String> operatingHoursList = new List<String>();

    //     // Query to retrieve Service Resource ID related to the Service Appointment
    //     String serviceResourceQuery = 'SELECT ServiceResourceId FROM ServiceAppointment WHERE Id = \'' + serviceAppointmentId + '\' LIMIT 1';
    //     ServiceAppointment serviceAppointment = (ServiceAppointment)Database.query(serviceResourceQuery);

    //     if (serviceAppointment != null && serviceAppointment.ServiceResourceId != null) {
    //         // Query to retrieve operating hours from the Service Resource
    //         String operatingHoursQuery = 'SELECT OperatingHours FROM ServiceResource WHERE Id = \'' + serviceAppointment.ServiceResourceId + '\' LIMIT 1';
    //         ServiceResource serviceResource = (ServiceResource)Database.query(operatingHoursQuery);

    //         if (serviceResource != null && serviceResource.OperatingHours != null) {
    //             // Split the operating hours string and add each operating hour to the list
    //             operatingHoursList = serviceResource.OperatingHours.split(';');
    //         }
    //     }

    //     return operatingHoursList;
    // }

    // public static List<String> getTimeSlots(String serviceAppointmentId) {
    //     List<String> timeSlotsList = new List<String>();

    //     // Query to retrieve Service Territory ID related to the Service Appointment
    //     String serviceTerritoryQuery = 'SELECT ServiceTerritoryId FROM ServiceAppointment WHERE Id = \'' + serviceAppointmentId + '\' LIMIT 1';
    //     ServiceAppointment serviceAppointment = (ServiceAppointment)Database.query(serviceTerritoryQuery);

    //     if (serviceAppointment != null && serviceAppointment.ServiceTerritoryId != null) {
    //         // Query to retrieve Operating Hours from the Service Territory
    //         String operatingHoursQuery = 'SELECT OperatingHours FROM ServiceTerritory WHERE Id = \'' + serviceAppointment.ServiceTerritoryId + '\' LIMIT 1';
    //         ServiceTerritory serviceTerritory = (ServiceTerritory)Database.query(operatingHoursQuery);

    //         if (serviceTerritory != null && serviceTerritory.OperatingHours != null) {
    //             // Split the operating hours string and add each time slot to the list
    //             List<String> operatingHoursList = serviceTerritory.OperatingHours.split(';');
                
    //             // Assuming each operating hour is formatted like "Day:StartTime-EndTime"
    //             for (String operatingHour : operatingHoursList) {
    //                 String[] parts = operatingHour.split(':');
    //                 String day = parts[0];
    //                 String[] timeRange = parts[1].split('-');
    //                 String startTime = timeRange[0];
    //                 String endTime = timeRange[1];
                    
    //                 // Now you can use 'day', 'startTime', and 'endTime' to generate time slots or perform other operations
    //                 // For example, you can add them to the 'timeSlotsList' or process them in any other way based on your requirements.
    //                 // In this example, we are just adding the entire operating hour string to the list.
    //                 timeSlotsList.add(operatingHour);
    //             }
    //         }
    //     }

    //     return timeSlotsList;
    // }

    // public static List<String> getTimeSlots(String serviceAppointmentId) {
    //     List<String> timeSlotsList = new List<String>();

    //     // Query to retrieve Service Territory ID related to the Service Appointment
    //     String serviceTerritoryQuery = 'SELECT ServiceTerritoryId FROM ServiceAppointment WHERE Id = \'' + serviceAppointmentId + '\' LIMIT 1';
    //     ServiceAppointment serviceAppointment = (ServiceAppointment)Database.query(serviceTerritoryQuery);

    //     if (serviceAppointment != null && serviceAppointment.ServiceTerritoryId != null) {
    //         // Query to retrieve Operating Hours from the Service Territory
    //         String operatingHoursQuery = 'SELECT OperatingHours FROM ServiceTerritory WHERE Id = \'' + serviceAppointment.ServiceTerritoryId + '\' LIMIT 1';
    //         ServiceTerritory serviceTerritory = (ServiceTerritory)Database.query(operatingHoursQuery);

    //         if (serviceTerritory != null && serviceTerritory.OperatingHours != null) {
    //             // Split the operating hours string and add each time slot to the list
    //             List<String> operatingHoursList = serviceTerritory.OperatingHours.split(';');

    //             // Assuming each operating hour is formatted like "Day:StartTime-EndTime"
    //             for (String operatingHour : operatingHoursList) {
    //                 String[] parts = operatingHour.split(':');
    //                 String day = parts[0];
    //                 String[] timeRange = parts[1].split('-');
    //                 String startTime = timeRange[0];
    //                 String endTime = timeRange[1];

    //                 // Now you can use 'day', 'startTime', and 'endTime' to generate time slots or perform other operations
    //                 // For example, you can add them to the 'timeSlotsList' or process them in any other way based on your requirements.
    //                 // In this example, we are just adding the entire operating hour string to the list.
    //                 timeSlotsList.add(operatingHour);
    //             }
    //         }
    //     }

    //     return timeSlotsList;
    // }

    // public static List<String> getAvailableBookingSlots(String appointmentId, String operatingHoursName) {
    //     List<String> availableSlots = new List<String>();

    //     // Query to retrieve Service Appointment details
    //     String serviceAppointmentQuery = 'SELECT ServiceResourceId, StartDateTime, EndDateTime FROM ServiceAppointment WHERE Id = \'' + appointmentId + '\' LIMIT 1';
    //     ServiceAppointment serviceAppointment = (ServiceAppointment)Database.query(serviceAppointmentQuery);

    //     if (serviceAppointment != null && serviceAppointment.ServiceResourceId != null) {
    //         // Query to retrieve Operating Hours from the Service Resource
    //         String operatingHoursQuery = 'SELECT OperatingHours FROM ServiceResource WHERE Id = \'' + serviceAppointment.ServiceResourceId + '\' LIMIT 1';
    //         ServiceResource serviceResource = (ServiceResource)Database.query(operatingHoursQuery);

    //         if (serviceResource != null && serviceResource.OperatingHours != null) {
    //             // Split the operating hours string and filter based on the specified operating hours name
    //             List<String> operatingHoursList = serviceResource.OperatingHours.split(';');
    //             List<String> filteredOperatingHours = new List<String>();
                
    //             for (String operatingHour : operatingHoursList) {
    //                 if (operatingHour.contains(operatingHoursName)) {
    //                     filteredOperatingHours.add(operatingHour);
    //                 }
    //             }

    //             // Iterate through the filtered operating hours to find available slots
    //             for (String operatingHour : filteredOperatingHours) {
    //                 String[] parts = operatingHour.split(':');
    //                 String day = parts[0];
    //                 String[] timeRange = parts[1].split('-');
    //                 String startTime = timeRange[0];
    //                 String endTime = timeRange[1];

    //                 // Now you can use 'day', 'startTime', and 'endTime' to generate time slots or perform other operations
    //                 // For example, you can check existing bookings within the specified time range
    //                 List<String> existingBookings = getExistingBookings(serviceAppointment.ServiceResourceId, day, startTime, endTime);

    //                 // Assuming each slot is 30 minutes
    //                 List<String> availableSlotsInHour = generateAvailableSlots(startTime, endTime, existingBookings);

    //                 // Add the available slots to the result list
    //                 availableSlots.addAll(availableSlotsInHour);
    //             }
    //         }
    //     }

    //     return availableSlots;
    // }

    // public static List<Map<String, String>> getTimeSlots(String operatingHoursId) {
    //     List<Map<String, String>> timeSlotsList = new List<Map<String, String>>();

    //     // Query to retrieve Operating Hours details
    //     String operatingHoursQuery = 'SELECT Id, DayOfWeek__c, StartTime__c, EndTime__c FROM OperatingHours__c WHERE Id = \'' + operatingHoursId + '\' LIMIT 1';
    //     OperatingHours__c operatingHoursRecord = (OperatingHours__c)Database.query(operatingHoursQuery);

    //     if (operatingHoursRecord != null) {
    //         // Get the day of the week, start time, and end time from the operating hours record
    //         String dayOfWeek = operatingHoursRecord.DayOfWeek__c;
    //         String startTime = operatingHoursRecord.StartTime__c;
    //         String endTime = operatingHoursRecord.EndTime__c;

    //         // Generate time slots based on the specified operating hours
    //         List<String> timeSlots = generateTimeSlots(dayOfWeek, startTime, endTime);

    //         // Create a list of maps to store day of the week, start time, and end time for each time slot
    //         for (String timeSlot : timeSlots) {
    //             Map<String, String> timeSlotMap = new Map<String, String>();
    //             timeSlotMap.put('DayOfWeek', dayOfWeek);
    //             timeSlotMap.put('StartTime', timeSlot.split('-')[0]);
    //             timeSlotMap.put('EndTime', timeSlot.split('-')[1]);
    //             timeSlotsList.add(timeSlotMap);
    //         }
    //     }

    //     return timeSlotsList;
    // }

    // // Method to generate time slots based on day of the week, start time, and end time
    // private static List<String> generateTimeSlots(String dayOfWeek, String startTime, String endTime) {
    //     // Implement the logic to generate time slots based on the specified criteria
    //     // This is a simplified example assuming each slot is 30 minutes
    //     // You may need to adjust this logic based on your specific requirements
    //     // ...

    //     List<String> timeSlots = new List<String>();
    //     DateTime startDateTime = DateTime.newInstanceGmt(Date.today(), Time.newInstance(Integer.valueOf(startTime.split(':')[0]), Integer.valueOf(startTime.split(':')[1]), 0, 0));
    //     DateTime endDateTime = DateTime.newInstanceGmt(Date.today(), Time.newInstance(Integer.valueOf(endTime.split(':')[0]), Integer.valueOf(endTime.split(':')[1]), 0, 0));

    //     while (startDateTime < endDateTime) {
    //         timeSlots.add(startDateTime.format('EEEE HH:mm') + '-' + startDateTime.addMinutes(30).format('HH:mm'));
    //         startDateTime = startDateTime.addMinutes(30);
    //     }

    //     return timeSlots;
    // }

    @AuraEnabled
    public static List<Map<String, String>> getSlots(String operatingHoursId) {
        try {
            List<Map<String, String>> transformedList = new List<Map<String, String>>();
            List<TimeSlot> tSlot = new List<TimeSlot>([SELECT OperatingHoursId, Id, DayOfWeek, StartTime, EndTime FROM TimeSlot where OperatingHoursId =: operatingHoursId]);


            for (TimeSlot timeSlot : tSlot) {
                Map<String, String> timeSlotMap = new Map<String, String>();
                timeSlotMap.put('OperatingHoursId', timeSlot.OperatingHoursId);
                timeSlotMap.put('Id', timeSlot.Id);
                timeSlotMap.put('DayOfWeek', timeSlot.DayOfWeek);
                timeSlotMap.put('StartTime', String.valueOf(timeSlot.StartTime));
                timeSlotMap.put('EndTime', String.valueOf(timeSlot.EndTime));
    
                transformedList.add(timeSlotMap);
            }


            System.debug(transformedList);
            return transformedList;
        } 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class WorkOrderDataWrapper {
        @AuraEnabled
        public String workOrderId;
        @AuraEnabled
        public String subject;
        @AuraEnabled
        public String description;
        @AuraEnabled
        public String workType;
        @AuraEnabled
        public List<ServiceAppointmentDataWrapper> serviceAppointments;

        public WorkOrderDataWrapper(String workOrderId, String subject, String description, String workType, List<ServiceAppointmentDataWrapper> serviceAppointments) {
            this.workOrderId = workOrderId;
            this.subject = subject;
            this.description = description;
            this.workType = workType;
            this.serviceAppointments = serviceAppointments;
        }
    }
    public class ServiceAppointmentDataWrapper {
        @AuraEnabled
        public String serviceAppointmentId;
        @AuraEnabled
        public String scheduledStart;
        @AuraEnabled
        public String scheduledEnd;
        // Add other fields as needed

        public ServiceAppointmentDataWrapper(String serviceAppointmentId, String scheduledStart, String scheduledEnd) {
            this.serviceAppointmentId = serviceAppointmentId;
            this.scheduledStart = scheduledStart;
            this.scheduledEnd = scheduledEnd;
        }
    }

    public class responseWrapper{
        public List<workTypes> workList;
        public string orderId;
        public string status;
        public string errors;
        public string address;
        public string saId;
        public List<slots> slotList;
     }
     public class slots{
         public string startDate;
         public List<appts> apptList;
     }
     public class appts{
         public string start;
         public string endtime;
         public string slotId;
     }
    
     public class workTypes{
         public string label;
         public string value;
         public string orderId;
     }
     public class requestWrapper{
         public string quoteId;
         public string startdate;
         public string enddate;
         public string WorkTypeId;
         public string type;
         public string saId;        
     }
     public class products{
         public string SKU;
         public string quantity;
     }
     
}