package flixel.util.helpers;

import flixel.util.FlxStringUtil;
import flixel.math.FlxPoint;

/**
 * Helper object for holding beginning minimum/maximum and ending minimum/maximum values of different properties.
 * It would extend Range<Bounds<T>> but this allows a more practical use of set().
 */
class FlxRangeBounds<T>
{
	public var start:FlxBounds<T>;
	public var end:FlxBounds<T>;
	
	/**
	 * Create a new RangeBounds object. Must be typed, e.g. var myRangeBounds = new RangeBounds<Float>(0, 0, 0, 0);
	 * 
	 * @param   startMin  The minimum possible initial value of this property for particles launched from this emitter.
	 * @param   startMax  The maximum possible initial value of this property for particles launched from this emitter. Optional, will be set equal to startMin if ignored.
	 * @param   endMin    The minimum possible final value of this property for particles launched from this emitter. Optional, will be set equal to startMin if ignored.
	 * @param   endMax    The maximum possible final value of this property for particles launched from this emitter. Optional, will be set equal to startMax if ignored.
	 * @return  This RangeBounds instance (nice for chaining stuff together).
	 */
	public function new(startMin:T, ?startMax:Null<T>, ?endMin:Null<T>, ?endMax:Null<T>)
	{
		start = new FlxBounds<T>(startMin, startMax == null ? startMin : startMax);
		end = new FlxBounds<T>(endMin == null ? startMin : endMin, endMax == null ? start.max : endMax);
	}
	
	/**
	 * Handy function to set the the beginning and ending range of values for an emitter property in one line.
	 * 
	 * @param   startMin  The minimum possible initial value of this property for particles launched from this emitter.
	 * @param   startMax  The maximum possible initial value of this property for particles launched from this emitter. Optional, will be set equal to startMin if ignored.
	 * @param   endMin    The minimum possible final value of this property for particles launched from this emitter. Optional, will be set equal to startMin if ignored.
	 * @param   endMax    The maximum possible final value of this property for particles launched from this emitter. Optional, will be set equal to startMax if ignored.
	 * @return  This RangeBounds instance (nice for chaining stuff together).
	 */
	public function set(startMin:T, ?startMax:Null<T>, ?endMin:Null<T>, ?endMax:Null<T>):FlxRangeBounds<T>
	{
		start.min = startMin;
		start.max = startMax == null ? start.min : startMax;
		end.min = endMin == null ? start.min : endMin;
		end.max = endMax == null ? end.min : endMax;
		
		return this;
	}
	
	/**
	 * Function to compare this FlxRangeBounds to another.
	 * 
	 * @param	OtherFlxRangeBounds  The other FlxRangeBounds to compare to this one.
	 * @return	True if the FlxRangeBounds have the same min and max value, false otherwise.
	 */
	public inline function equals(OtherRangeBounds:FlxRangeBounds<T>):Bool
	{
		return start.equals(OtherRangeBounds.start) && end.equals(OtherRangeBounds.end);
	}
	
	/**
	 * Convert object to readable string name. Useful for debugging, save games, etc.
	 */
	public function toString():String
	{
		return FlxStringUtil.getDebugString([ 
			LabelValuePair.weak("start.min", start.min),
			LabelValuePair.weak("start.max", start.min),
			LabelValuePair.weak("end.min", end.min),
			LabelValuePair.weak("end.max", end.max)]);
	}
}