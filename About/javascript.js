window.onscroll = function() {
    move();
};
var i = 0;

function move() {
    if (i == 0) {
        i = 1;
        var elem = document.getElementById("myBar");
        var width = 1;
        var id = setInterval(frame, 30);

        function frame() {
            if (width >= 80) {
                clearInterval(id);
                i = 0;
            } else {
                width++;
                elem.style.width = width + "%";
                document.getElementById("myBar").innerHTML = width++ + "%";
            }
        }
    }
}
