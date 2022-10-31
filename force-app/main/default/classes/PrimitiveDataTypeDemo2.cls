public class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new date instance');
        
        Date newDate=Date.newInstance(1997,8,18);
        system.debug('newDate is  '+newDate);

        date newDate2=date.newInstance(2022,2,22);
        system.debug('newDate is  '+newDate2);

        date todayDate=date.today();
        system.debug('today\'s date is   '+todayDate);
    }

    public void printNewTime(){
        Time myTime=time.newInstance(18,25,15,52);
        system.debug(myTime);

        Time meTime=time.newInstance(5,15,35,5);
        system.debug(meTime);
    }

    public void printNewDateTime(){
        date todayDate=date.today();
        Time myTime=time.newInstance(18,25,15,52);

        //1.new datetime from date and time
        Datetime dt1=datetime.newInstance(todayDate,myTime);
        system.debug('dt1 is --> '+dt1);
        //2.new datetime from year,day--> time will be midnight 000
        datetime dt2=Datetime.newInstance(2025,1,14);
        system.debug('dt2 is --> '+dt2);
        //3.datetime with year,mont,day.hour.min,sec
        datetime dt3=Datetime.newInstance(2022,5,12,1,45,6);
        system.debug('dt3 is-->'+dt3);

        //4.longtime
        long longtime=11565196614L;
        datetime dt4=datetime.newInstance(longtime);

        long longtimeZero=0;
        datetime dt41=datetime.newInstance(longtimeZero);
        system.debug('dt4 --->'+dt4);
        system.debug('dt41 --->'+dt41);
        //5.gmt
        datetime dt5=Datetime.newInstanceGMT(2022,5,12,1,45,6);
        system.debug('dt5 is -->'+dt5);   
        //6.now
        datetime dt6=Datetime.now();
        system.debug('dt6 -->'+dt6);
        Datetime dt7=system.now();
        system.debug('dt7 -->'+dt7);
    
    }
}
