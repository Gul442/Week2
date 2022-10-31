@istest
public class AccountQueueableExampleTest {
    @TestSetup
    static void makedata(){
        
        List<account> accs= new List<account>();
        for (integer i=0;i<200;i++) {
            account a= new account(name='Test Account '+i);
            accs.add(a); 
        }
        insert accs;
    }
    @istest
    private static void testQueueable() {
        List<account> allAccs = [select id,name from account];
        AccountQueueableExample aq= new AccountQueueableExample(allAccs);
        test.starttest();
        system.enqueueJob(aq);
        test.stoptest();

        list<account> resultAcc=[select id,name from account where name like '%SI%'];
        System.assertEquals(200, resultAcc.size());
        
    }
}
