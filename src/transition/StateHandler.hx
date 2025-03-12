// A main game state handler with transition included, so free to edit this if you want to improve our class file :D

package transition;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIState;
#if (flixel >= "5.6.0")
import flixel.util.typeLimit.NextState;
#end

class StateHandler extends FlxUIState
{
    override public function create()
    {
        super.create();

        openSubState(new Transition(true));
    }

    public static var activeState:FlxState;
    #if (flixel >= "5.6.0")
    public static function switchToNewState(?target:NextState):Void
    {
        var trans = new Transition(false);
        trans.callbackFinished = function()
        {
            if(target != null) FlxG.switchState(target); else FlxG.resetState();
        };
    
        if(activeState != null) activeState.openSubState(trans);
    }
    #else
    public static function switchToNewState(?target:FlxState):Void
    {
        var trans = new Transition(false);
        trans.callbackFinished = function()
        {
            if(target != null) FlxG.switchState(target); else FlxG.resetState();
        };
    
        if(activeState != null) activeState.openSubState(trans);
    }
#end
}
