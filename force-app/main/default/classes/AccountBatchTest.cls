@istest
public class AccountBatchTest {
    @istest
    private static void testBatch1() {
        //1.prepare data
        List<account> listAcc = new list<account>();
       for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'test acc batch'+i;
            listAcc.add(a);
        }
        insert listAcc;
        //2.statrtest, stoptest,,intance
        test.startTest();
        accountsBatch ab= new accountsBatch();
        database.executeBatch(ab,950);
        test.stopTest();
         list<account> results=[select id,description from account];
         System.assert(results[0].description.contains('Batch'));
    }
}
