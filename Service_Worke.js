// if ("serviceWorker" in navigator) {
//   navigator.serviceWorker.register("./pwa-examples/js13kpwa/sw.js").then(registation=>{
//       console.log("service worker registerd");
//       console.log(registation);

//   })
// } else {
//   alert("serviceworker not working");
// }
if ("serviceWorker" in navigator) {
    // Register a service worker hosted at the root of the
    // site using the default scope.
    navigator.serviceWorker
        .register("sw.js")
        .then(function(registration) {
            console.log("Service worker registration succeeded:", registration);
        })
        .catch(function(error) {
            console.log("Service worker registration failed:", error);
        });
} else {
    alert("Service workers are not supported.");
}




function showNotification() {
    Notification.requestPermission(function(result) {
        if (result === 'granted') {
            navigator.serviceWorker.ready.then(function(registration) {
                registration.showNotification('Vibration Sample', {
                    body: 'Buzz! Buzz!',
                    icon: '../images/touch/chrome-touch-icon-192x192.png',
                    vibrate: [200, 100, 200, 100, 200, 100, 200],
                    tag: 'vibration-sample'
                });
            });
        }
    });
}