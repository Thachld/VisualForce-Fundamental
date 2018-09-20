public with sharing class ParameterPassing 
{
	public string name{get;set;}

	//Contructor
	public ParameterPassing() 
	{
		name = System.currentPageReference().getParameters().get('name');	 
	}
}