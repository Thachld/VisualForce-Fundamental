public with sharing class MultiSelectPicklist 
{
	Set<String> initPicklistvalues = new Set<String>{'New York','California','Texas','Los Angeles','Chicago','San Francisco', 'Washington'};

	public List<String> leftSelected {get;set;}
	public List<String> rightSelected {get;set;}
	public List<SelectOption> leftOptionValues {get;set;}
	public List<SelectOption> rightOptionValues {get;set;}


	Set<String> leftValues = new Set<String>();
	Set<String> rightValues = new Set<String>();

	public MultiSelectPicklist() 
	{
		leftSelected = new List<String>();	
		rightSelected = new List<String>();	
		rightValues.addAll(initPicklistvalues);
		leftOptionValues = selectedValues();
	}

	public Pagereference getSelected()
	{
		rightSelected.clear();
		for (string s : leftSelected)
		{
			leftValues.remove(s);
			rightValues.add(s);			
		}

		return null;
	}

	public Pagereference getDeselected()
	{
		leftSelected.clear();
		for (string s : rightSelected)
		{
			rightValues.remove(s);
			leftValues.add(s);
		}

		return null;
	}

	//Select option values
	private List<SelectOption> selectedValues()
	{
		List<SelectOption> rightOption = new List<SelectOption>();
		list<string> rightlist = new List<String>();
		rightlist.addAll(rightValues);
		rightlist.sort();

		for (String s: rightlist)
		{
			rightOption.add(new SelectOption(s,s));
		}	

		return rightOption;
	}

	//DeSelect option values

	private List<SelectOption> deSelectValues()	{
		
		List<SelectOption> leftOption = new List<SelectOption>();
		list<string> lefttlist = new List<String>();
		lefttlist.addAll(leftValues);
		lefttlist.sort();

		for (String s: lefttlist)
		{
			leftOption.add(new SelectOption(s,s));
		}	

		return leftOption;	
	}	
}