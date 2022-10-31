DateTimeMethodsDemo dm=new DateTimeMethodsDemo();
//dm.calculateAgeInMonths();
//dm.calculateAgeInDays();
//dm.printSubscriptionEndDate();
dm.printOfferDateTime();
 datetime  birthday=datetime.newInstance(1988,11,17);
 long longBirthDay=birthday.getTime();
 system.debug('long birth date='+longBirthDay);
