public class Cat {
    public string name;
    public string color;
    //parameterized constructor
    public Cat(string n,string clr){
        name=n;
        color=clr;
        sleeping();
    }
    //name as same as class name
    //doesnt NOT return anything,,non-parameterized constructor
    public Cat() {
        system.debug('cat contructor called');

    }
   public void sleeping (){
    system.debug(name+' is sleeping');
   }
}
