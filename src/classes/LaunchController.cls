public with sharing class LaunchController {
	public Pagereference allowAccess() 
	{
		Pagereference pr = Page.Protected;

		try {
			pr.getContent();
		   
		} catch (Exception e) {
		   pr = null;
		}
		
		return pr;		
	}
}