public class Car {
    public string carColor='';
    public string carName;

    integer maxSpeedKmPerHr=150;

    public void switchOn(){
        system.debug('starting the car NOW');
    }
    public void drive(){
        switchOn();
        system.debug('driving....'+carName);
    }
    public void driveAtMaxSpeed(){
        drive();
        string description='driving '+carName+' at max speed of '+maxSpeedKmPerHr+'km/hr';
        system.debug(description);
    }
}
