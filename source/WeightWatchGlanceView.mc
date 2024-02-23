import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;

(:glance) class WeightWatchGlanceView extends WatchUi.GlanceView {
    (:glance) private var _weightPrefixStr as String;
    (:glance) private var _weightUnitsStr as String;
    (:glance) private var _itemNotSetStr as String;
    private var _weightWatcher;

    (:glance) function initialize(weightWatcher as WeightWatcher) {
        GlanceView.initialize();

        _weightWatcher = weightWatcher;
        _weightPrefixStr = WatchUi.loadResource(Rez.Strings.WeightPrefix) as String;
        _weightUnitsStr = WatchUi.loadResource(Rez.Strings.KgUnits) as String;
        _itemNotSetStr = WatchUi.loadResource(Rez.Strings.ItemNotSet) as String;
    }

    // Load your resources here
    (:glance) function onLayout(dc as Dc) as Void {
        View.setLayout(Rez.Layouts.GlanceLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    (:glance) function onShow() as Void {
    }

    // Update the view
    (:glance) function onUpdate(dc as Dc) as Void {
        var weightString = _weightPrefixStr;
        var weight = _weightWatcher.getWeight();
        if (weight != null) {
            weight = weight / 1000;
            weightString += weight + _weightUnitsStr;
        } else {
            weightString += _itemNotSetStr;
        }
        (findDrawableById("WeightLabel") as Text).setText(weightString);
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    (:glance) function onHide() as Void {
    }

}
