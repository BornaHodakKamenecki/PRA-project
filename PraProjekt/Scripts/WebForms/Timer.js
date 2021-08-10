var timer = $('.timer');

function clearCountdown(interval) {
    clearTimeout(interval);
}

function countdown() {
    var countdownBegin = 30;
    var count = setInterval(function () {
        console.log(countdownBegin);

        if (countdownBegin <= 0) {
            timer.html('Done!');
            clearCountdown(count);
        } else {
            --countdownBegin;
            timer.html(countdownBegin);
        }
    }, 1000);
}

countdown();