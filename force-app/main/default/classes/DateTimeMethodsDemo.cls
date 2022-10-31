public  class DateTimeMethodsDemo {
    public void calculateAgeInMonths(){
        date todayDate=date.today();
        date birthday=date.newInstance(1988,11,17);
        integer ageInMonths =birthday.monthsBetween(todayDate);
        system.debug('Gül age in moths is..'+ageInMonths);
        }
    public void calculateAgeInDays(){
        date todayDate=date.today();
        date birthday=date.newInstance(1988,11,17);
        integer ageInDays =birthday.daysBetween(todayDate);
        system.debug('Gül age in moths is..'+ageInDays);
        }

    public void printSubscriptionEndDate(){
        date subscriptionStartDate=date.today();
        date subscriptionEndDate=subscriptionStartDate.addDays(1000);
        system.debug('subscription will end ON '+subscriptionEndDate);
        integer yearEndDate=subscriptionEndDate.year();
        integer monthEndDate=subscriptionEndDate.month();
        system.debug('Year and month of End Date is '+yearEndDate+' '+monthEndDate);

    }
    public void printOfferDateTime(){

        datetime offerStartDt=Datetime.now();
        Datetime offerEndDt=offerStartDt.addHours(51);
        system.debug('offer ends datetime '+offerEndDt);
        //fetch just date component
        date offerEndDate=offerEndDt.date();
        system.debug('offerEndDate is '+offerEndDate);
    }
}
