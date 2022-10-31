trigger SPTrigger on Salesforce_Project__c (after insert, after update) {
    Map<Id, Salesforce_Project__c> newSFMap = trigger.newmap;
 
 if(trigger.isAfter){
 for(id projectID : newSFMap.keyset()){
 system.debug('Project name : ' + 
newSFMap.get(projectID).Project_Name__c);
 }
 }
}