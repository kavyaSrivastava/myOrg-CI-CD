public class A4Q4 {
    
    public static DateTime dateDiff(){
        Datetime startDate = Datetime.newInstance(2018,03 , 19, 10, 39, 55);
        Datetime endDate = Datetime.newInstance(2018, 10, 28, 12, 20,30);        
        Integer years = endDate.year() - startDate.year();
        Integer months = endDate.month() - startDate.month();
        Integer days = endDate.day() - startDate.day();
        Integer hours = endDate.hour() - startDate.hour();
        Integer minutes = endDate.minute() - startDate.minute();
        Integer seconds = endDate.second() - startDate.second();
        if (seconds < 0) {
            seconds += 60;
            minutes--;
        }
        if (minutes < 0) {
            minutes += 60;
            hours--;
        }
        if (hours < 0) {
            hours += 24;
            days--;
        }
        if (days < 0) {
            days += 30;
            months--;
        }
        if (months < 0) {
            months += 12;
            years--;
        }
        System.debug('Difference between dates: ' + years + ' years, ' + months + ' months, ' + days + ' days, ' + hours + ' hours, ' + minutes + ' minutes, ' + seconds + ' seconds.');
          DateTime d = DateTime.newInstance(years, months, days, hours, minutes,  seconds);
        return d;
    }
}