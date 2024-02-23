import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class WeightWatchApp extends Application.AppBase {
    private var _weightWatcher;

    function initialize() {
        AppBase.initialize();

        _weightWatcher = new WeightWatcher();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new WeightWatchView() ] as Array<Views or InputDelegates>;
    }

    // Return the initial view of your application here
    (:glance) function getGlanceView() as Array<GlanceView or GlanceViewDelegate>? {
        return [ new WeightWatchGlanceView(_weightWatcher) ] as Array<GlanceView or GlanceViewDelegate>;
    }

}

function getApp() as WeightWatchView {
    return Application.getApp() as WeightWatchView;
}