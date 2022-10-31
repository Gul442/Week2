public class SalesforceProjectTriggerHandler {
    public static void  insertSFProject(){
        list<salesforce_project__c> listSP=new list<salesforce_project__c>();
        for (Integer i = 1; i < 4; i++) {
            salesforce_project__c sp= new salesforce_project__c();
            sp.Project_Name__c='Project trigger '+i;
            sp.status__c='Completed';
            listSP.add(sp);
        }
        if (!listSP.isEmpty()) {
            insert listSP;  
        }
    }

    public static void  updateSFProject() {
        list<salesforce_project__c> updateSP=[select name from Salesforce_Project__c order by createddate limit 3];
        list<salesforce_project__c> newSP=new list<salesforce_project__c>();
        for (salesforce_project__c eachSP : updateSP) {
            eachSP.Project_Name__c='project update';
            newSP.add(eachSP);
        }  
        if (!updateSP.isEmpty()) {
            update newSP;  
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

    
    public static void spCompletedProject(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld,
                                Map<id, salesforce_project__c> spTriggerNewMap, Map<id, salesforce_project__c> spTriggerOldMap) {
        set<id> spIds = new set<id>();

        for (salesforce_project__c spNew : spTriggerNew) {
            salesforce_project__c spOld = spTriggerOldMap.get(spNew.Id);
            if (spNew.Status__c == 'Completed' && spOld.Status__c != 'Completed') {
                spIds.add(spNew.Id);
            }
        }

        system.debug('sp Ids where status is completed -> ' + spIds);
        //call future method and pass this spIds.
        if (!spIds.isEmpty()) {
            updateTicketStatusCompleted(spIds);
        }
    }

    @future
    private static void updateTicketStatusCompleted(set<id> spIds) {
        List<Salesforce_Ticket__c> listST = [select id, status__c from 
                                Salesforce_Ticket__c where Status__c != 'Completed' and Salesforce_Project__c in :spIds];
        for (salesforce_ticket__c st : listST) {
            st.Status__c = 'Completed';
        }
        update listST;
    }







}


