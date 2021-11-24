package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class ThankState extends MusicBeatState
{   

    
	var dropText:FlxText;
	var warningMusic:FlxSound;

    override  function create():Void
	{
        DiscordClient.changePresence("Inside The Opening Menu", null);

        FlxG.sound.music.stop();
        warningMusic = new FlxSound().loadEmbedded(Paths.music("breakfast", "shared"), true, true);
		warningMusic.volume = 0;
		warningMusic.play(false, FlxG.random.int(0, Std.int(warningMusic.length / 2)));
		
		FlxG.sound.list.add(warningMusic);

        var pic:FlxSprite = new FlxSprite(-650, -350).loadGraphic(Paths.image('Thanks_Pic'));
		pic.setGraphicSize(Std.int(pic.width * .9));
        pic.alpha = 0;
		add(pic);

        dropText = new FlxText(-150, 0, Std.int(FlxG.width * 1.2), "", 22);
		dropText.font = 'century gothic';
		dropText.color = FlxColor.WHITE;
        dropText.alignment = FlxTextAlign.CENTER;
        dropText.alpha = 0;
		add(dropText);
        FlxTween.tween(pic, {alpha: 1}, 1.2, {ease: FlxEase.circOut});
        FlxTween.tween(dropText, {alpha: 1}, 1.2, {ease: FlxEase.circOut});
       
    }


    override function update(elapsed:Float)
	{
		if (warningMusic.volume < 0.3)
			warningMusic.volume += 0.01 * elapsed;
			
        dropText.text = "Before You Start!

I just want to say thank you for playing my mod!
This mod took a few months to make and I enjoyed the experience!
That being said, this mod isn't the best. Before making this, I had absolutely no experience with modding at all.
I originally had this idea when Friday Night Funkin' mods were starting to become popular, and I thought I'd take a shot at it.
Because I made this mod, I found that I find a lot of joy in making music! I hope this mod expresses that.
I had a lot of fun making this mod, and I hope you have fun playing it!
And lastly, I just want to thank everyone who supported me during the making of this mod.
It wasn't easy, and it took a lot of late nights to perfect.
But because you all supported me along the way, I was able to make this mod a reality.
Now, I hope you enjoy the mod!

(P.S. All credit goes to the Soft Mod development team for the code for this screen)

(Press any key to continue)";
        dropText.visible = true;
        dropText.screenCenter();
         if (FlxG.keys.justPressed.ANY)
		{
            FlxG.sound.music.stop();
            FlxG.switchState(new MainMenuState());
		}
       
    }
}