import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.UserProfile;

(:glance) class WeightWatcher {
    
    (:glance) function initialize() {
    }

    (:glance) function getWeight() as Lang.Number or Null {
        var profile = UserProfile.getProfile();

        if (profile == null) {
            return null;
        }
        
        return profile.weight;
    }
}