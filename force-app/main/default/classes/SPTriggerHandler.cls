public class SPTriggerHandler {
    public static void createDefaultSalesforceTicket(list<Salesforce_Project__c> spTriggerNew) {
        try {
            list<salesforce_Ticket__c> listST= new list<salesforce_Ticket__c>();
            DefaultTicketInfo__c dt= DefaultTicketInfo__c.getOrgDefaults();
            for (salesforce_project__c eachSP : spTriggerNew) {
                salesforce_Ticket__c st=new salesforce_Ticket__c();
                st.subject__c=dt.subject__c;
                st.description__c=dt.description__c;
                st.priority__c='Medium';
                st.salesforce_project__c=eachSP.id;
                listST.add(st);
                
            }
            if (!listST.isempty()) {
                insert listST;
                
            }
        } catch (Exception ex) {
            System.debug('exception ex: '+ex);
            System.debug('contact admin');
            //call the code to log error
            //throw ex;
            for (salesforce_project__c eachSp : spTriggerNew) {
                eachsp.addError('Error in creating default ticket.Contect admin.Not me');
            }
            
        }
        
    }
    // public class SalesforceProjectTriggerHandler {
    //     public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
    //         List<Salesforce_Ticket__c> listST = new List<Salesforce_Ticket__c>();
    //         for (salesforce_project__c eachSP : spTriggerNew) {
    //             Salesforce_Ticket__c st = new Salesforce_Ticket__c();
    //             st.Subject__c = 'Default ST';
    //             st.Salesforce_Project__c = eachSP.id;
    //             listST.add(st);
    //         }
    //         if (!listST.isEmpty()) {
    //             insert listST;
    //         }
    //     }}
    
    public static void validateProjectCompletion(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld,
                                 Map<id, salesforce_project__c> spTriggerNewMap, Map<id, salesforce_project__c> spTriggerOldMap) {
            //get project for which status is updated to 'Completed'
            //compare old and new status to get if project changed to completed.
            set<id> setProjectCompletedIds = new set<id>();
            for (salesforce_project__c eachSP : spTriggerNew) {
                if(spTriggerOldMap.get(eachSP.id).Status__c != spTriggerNewMap.get(eachSP.id).Status__c
                && eachSP.Status__c == 'Completed'){
                    setProjectCompletedIds.add(eachSP.Id);
                }
            }
    
            //get all tickets which are not completed
            List<Salesforce_Ticket__c> listST = [select id, name, status__c, Salesforce_Project__c from Salesforce_Ticket__c
                                     where Salesforce_Project__c in :setProjectCompletedIds and status__c !='Completed'];
    
            for (Salesforce_Ticket__c eachST : listST) {
                Salesforce_Project__c sp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
                sp.addError('Cannot complete project because all its tickets are not completed.');
            }
        }
    
    @future
    
    public static void updateProjectDescription(set<id> setIds) {
    System.debug('Called from future');
    System.debug('set of ids => '+setIds);
    //fetch project records of given setids
    List<salesforce_project__c> listsp =[select id,description__c from salesforce_project__c where id in: setIds];

    for (salesforce_project__c sp : listsp) {
        sp.description__c+=' . updated from future it is.' ;
    }
    update listSP;
}
    }
                                
