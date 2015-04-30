package Filed.interfaces
{
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public interface ICellView 
	{
		function loadImage() 	: void;
		
		function addImage() 	: void;
		
		function switcher( type : int )	 	: void;
		
		function changePhase()	: void;
	}
	
}