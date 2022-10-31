public class AccountUpdateHelper {
    @invocableMethod
    public static void updateAccountWebsite(list<id> accIds) {
        list<account> updateAccounts= new list<account>();
        for (account eachAccount : [select id,website from account where id in : accIds]) {
            eachAccount.website='www.softinnova.com';
            updateAccounts.add(eachAccount);
        }
        update updateAccounts;
    }
}
