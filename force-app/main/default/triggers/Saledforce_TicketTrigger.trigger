trigger Saledforce_TicketTrigger on Salesforce_Ticket__c (before insert,before update) {
    //Assignment 17.2
  if (trigger.isbefore) {
   for (salesforce_Ticket__c eachST : trigger.new) {
       boolean highDesc=false;
       if (trigger.isinsert && eachST.Priority__c=='High') {
           highDesc=true;
       }
       if (trigger.isupdate ) {
           if (eachST.Priority__c=='High' && trigger.oldmap.get(eachST.id).priority__c != trigger.newmap.get(eachST.id).priority__c
           ) {
               highDesc=true;      
           }
       }
       if (highDesc) {
           eachST.Description__c='The ticket priority is HIGH. Work on it ASAP';
       }
   }
   
   
  }
}