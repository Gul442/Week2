
public static void parentToChild_SOQL1() {
    list<account> accountWithOpps = [select id, name, annualrevenue, type, 
                                    (select name, amount, stageName from opportunities where stageName = 'Closed Won') 
                                    from account where type = 'Customer - Direct'];
    for (account eachAcc : accountWithOpps) {
        system.debug('account name is ' + eachAcc.Name + ' and annual revenue is ' + eachAcc.AnnualRevenue);
        system.debug('----');
        List<Opportunity> accOpportunities = eachAcc.Opportunities;
        for (opportunity eachOpp : accOpportunities) {
            system.debug('opp name is ' + eachOpp.Name + ' AND amount is ' + eachOpp.Amount);
        }
        system.debug('============');
    }
}