public class ContactsCheckboxController {

    public string ContextItem{get;set;}
    public ApexPages.StandardSetController setCon; 
    public set<id> selectedContactIds;
    public id accountid{get;set;}
    
    
        public ContactsCheckboxController(){ 
            this.selectedContactIds= new set<id>();
            this.setCon= new ApexPages.StandardSetController([select id, name,account.name,phone from Contact]);
        }
        
        
    
        public void doSelectItem(){
            this.selectedContactIds.add(this.ContextItem);
        }
        
        
    
        public void doDeSelectItem(){
            this.selectedContactIds.remove(this.ContextItem);
        }
        
        
    
        public void getSelectedCount(){
        
            this.selectedContactIDs.size(); 
        }
        
        
    
        public list<rowItem> getContacts(){ 
        list<rowItem> rows= new list<rowItem>();
                for(sObject r : this.setCon.getRecords()){
                    Contact c = (Contact)r;
                    rowItem row= new rowItem(c,false);
                    if(this.selectedContactIds.contains(c.id))
                    {
                    row.IsSelected=true;
                    }
                 else
                 {
                 row.IsSelected=false;
                 }
        rows.add(row);
        }
        return rows;
        }
    
    
   public pageReference Save(){
   pageReference page= new pageReference('/'+accountid);
   return page;
   }
    
    public pageReference Cancel(){
    pageReference page= new pageReference ('/'+accountid);
    return page;
    }
    
        public class rowItem{
        public contact tContact{get;set;}
        public boolean isSelected{get;set;}
            public rowItem(Contact c,boolean s){
            this.tContact=c;
            this.isSelected=s;
            }
        }
}