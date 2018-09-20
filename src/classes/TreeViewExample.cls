public with sharing class TreeViewExample 
{	
	public class WCTReeView 
	{
	   	public Account Parent{get;set;}
		public List<Contact> Child {get;set;}

		public WCTReeView(Account objAC, List<Contact> objChild)
		{
			Child = objChild;
			Parent = objAC;
		}
	}

	public List<WCTReeView> TreeView{get;set;}

	public TreeViewExample()
	{
		TreeView = getNode();
	}

	public List<WCTReeView> getNode() 
	{
		TreeView = new List<WCTReeView>();
		List<Account> objACList = [SELECT Id, Name FROM Account];

		for (Integer i = 0; i< objACList.size(); i++)
		{
			List<Contact> objCt = [SELECT Id, FirstName, LastName FROM Contact Where AccountId = :objACList[i].id];
			TreeView.add(new WCTReeView(objACList[i], objCt));
		}

		return TreeView;
	}
		
	
}