
window.OneSignal = window.OneSignal || [];
OneSignal.push(function() {
    window.OneSignal = window.OneSignal || [];
    OneSignal.push(function() {
        OneSignal.init({
            appId: "76df60cb-3683-42c5-a78e-a0aae85206e3",
            notifyButton: {
                enable: true,
            },
            subdomainName: "kryche",
        });
    });
});

OneSignal.push(function() {
    /* These examples are all valid */
    var isPushSupported = OneSignal.isPushNotificationsSupported();
    if (isPushSupported) {
        // Push notifications are supported
        OneSignal.isPushNotificationsEnabled(function(isEnabled) {
            if (isEnabled)
                console.log("Push notifications are enabled!");
            else
                console.log("Push notifications are not enabled yet.");
            OneSignal.push(["getNotificationPermission", function(permission) {
                console.log("Site Notification Permission:", permission);
                // (Output) Site Notification Permission: default
            }]);
        });
    } else {
        // Push notifications are not supported
    }
});
