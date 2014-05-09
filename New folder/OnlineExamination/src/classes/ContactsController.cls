public class ContactsController {

    public ContactsController(ApexPages.StandardController controller) {

    }


    public ContactsController() {
 conid= apexPages.currentPage().getParameters().get('id');
  conlist=[select id,name,phone from contact where id =:conid  ];

    }


    public PageReference save() {
    update conlist;
    pageReference page= new pageReference('/'+accountid);
    return page;
    }
    
    public pageReference cancel(){
    pageReference page= new pageReference('/'+accountid);
    return page;
    }

public contact con{get;set;}
public string conid{get;set;}
public list<contact> conlist{get;set;}
public string selected{get;set;}
public string save{get;set;}
public integer count=0;
public integer list_size=20;
public account accountid{get;set;}


public list<selectOption> getItems(){
list<selectOption> options= new List<selectOption>();
for(contact c:conlist)
{
if(count<list_size && c.account==null){
options.add(new selectOption(c.id, c.id));
}
}
count++;
return options;
}

public string getSelected()
{
return null;
}


}