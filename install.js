let promptEvent = undefined;
self.addEventListener('beforeinstallprompt', event => {
    promptEvent = event;
    $("installbuttin").removeClass("d-none");
    $("installbuttin").addClass("d-block");
});

// if (promptEvent) {
//     $("installbuttin").removeClass("d-none");
//     $("installbuttin").addClass("d-block");
// } else {
//     $("installbuttin").removeClass("d-block");
//     $("installbuttin").addClass("d-none");
// }

$("#installbuttin").click(function() {
    promptEvent.prompt();
});