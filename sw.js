self.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open("cacheName").then(function(cache) {
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