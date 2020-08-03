self.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open(cacheName).then(function(cache) {
            return cache.addAll(
                [
                    "./",
                    "./style/media.css",
                    "./script.js",
                    "./style/style.css",
                    "./log/64x64.png",
                    "./log/512x512.png",
                    "./images/unnamed.png",
                    "./About/images/IMG_1085.jpg",
                    "./About/images/unnamed.png",
                    "./About/style/media.css",
                    "./About/style/style.css",
                    "./About/About.html",
                    "./About/javascript.js",
                ]
            );
        })
    );
});





let deferredPrompt;

window.addEventListener('beforeinstallprompt', (e) => {
    // Prevent the mini-infobar from appearing on mobile
    e.preventDefault();
    // Stash the event so it can be triggered later.
    deferredPrompt = e;
    // Update UI notify the user they can install the PWA
    function showInstallPromotion() {
        document.getElementById("btn")
    }
    showInstallPromotion();
});



buttonInstall.addEventListener('click', (e) => {
    // Hide the app provided install promotion
    hideMyInstallPromotion();
    // Show the install prompt
    deferredPrompt.prompt();
    // Wait for the user to respond to the prompt
    deferredPrompt.userChoice.then((choiceResult) => {
        if (choiceResult.outcome === 'accepted') {
            console.log('User accepted the install prompt');
        } else {
            console.log('User dismissed the install prompt');
        }
    });
});


self.addEventListener('fetch', function(event) {
    event.respondWith(
        caches.open('mysite-dynamic').then(function(cache) {
            return cache.match(event.request).then(function(response) {
                return response || fetch(event.request).then(function(response) {
                    cache.put(event.request, response.clone());
                    return response;
                });
            });
        })
    );
});







window.addEventListener('appinstalled', (evt) => {
    // Log install to analytics
    console.log('INSTALL: Success');
});





window.addEventListener('DOMContentLoaded', () => {
    let displayMode = 'browser tab';
    if (navigator.standalone) {
        displayMode = 'standalone-ios';
    }
    if (window.matchMedia('(display-mode: standalone)').matches) {
        displayMode = 'standalone';
    }
    // Log launch display mode to analytics
    console.log('DISPLAY_MODE_LAUNCH:', displayMode);
});




window.addEventListener('DOMContentLoaded', () => {
    window.matchMedia('(display-mode: standalone)').addListener((evt) => {
        let displayMode = 'browser tab';
        if (evt.matches) {
            displayMode = 'standalone';
        }
        // Log display mode change to analytics
        console.log('DISPLAY_MODE_CHANGED', displayMode);
    });
});