self.addEventListener("install", (e) => {
    console.log("[Service Worker] Install");
    e.waitUntil(
        caches.open("cacheName").then((cache) => {
            return cache.addAll([
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
            ]);
        })
    );
});

self.addEventListener("fetch", (e) => {
    e.respondWith(
        caches.match(e.request).then(Response => {
            return response || fetch(e.request);
        })
    );
});