package Filed.interfaces
{
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public interface ICell 
	{
		function get type() 				: int;
	
		function set type(value : int) 	: void;
		
		function initCellView() 		: void;		
	}	
}