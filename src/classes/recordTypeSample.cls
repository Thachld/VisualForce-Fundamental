public with sharing class recordTypeSample{
 
    public String selectedRT {get;set;}
    public List<SelectOption> recordTypeList {get;set;}
    public customer__c customer {get;set;}
     
    public recordTypeSample(){
     
        customer = new customer__c();
        recordTypeList = new List<SelectOption>(); 
        getRecordTypeList();
     
    }
     
    public void getRecordTypeList(){
          
        List<RecordType> rtList = [SELECT Id,Name FROM RecordType Where SObjectType = 'customer__c'];
        recordTypeList.add(new SelectOption('--None--', '--None--'));
        for(RecordType rt : rtList)
        {
            recordTypeList.add(new SelectOption(rt.Id, rt.Name));
        }
    }
     
     public void getPickListValues(){
      
        if(selectedRT != null){
            customer = new customer__c(RecordTypeId = selectedRT);
        }
    }
}