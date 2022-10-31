public class AccountSchedulable implements Schedulable{
    public void execute(schedulableContext sc){
        //to call batch here
        database.executeBatch(new accountsBatch());
        //default num 200
    }
    
}
