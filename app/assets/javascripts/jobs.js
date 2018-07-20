$(document).ready(function () {
  // clock
 let timeWatch = setInterval(getCurrentTime, 1000);

  function getCurrentTime(){
    var d = new Date();
    let start = d.toLocaleTimeString();
    if (document.getElementById("startTime")) {
      document.getElementById("startTime").innerHTML = start;
    }
  }
  
  if ($('#job_duration').length === 0) {
    return;
  }

  const startTime = $('#stopwatch').data('start') * 1000;

  $('#stopwatch').stopwatch({startTime: parseInt(startTime)}).stopwatch('start');

  const durationTime = $('#duration').data('start') * 1000;

  $('#duration').stopwatch({durationTime: parseInt(durationTime)}).stopwatch('start');

  $("#pauseJob").click(function(){
    let value = $("#pauseJob")[0].innerHTML
    // console.log(value);
    if (value==="Pause Job") {
      //pause the watch
      clearInterval(timeWatch);
      //pause the stopwatch
      $("#duration").stopwatch("toggle");
      $("#stopwatch").stopwatch("toggle");
      //change button to "resume"
      $("#pauseJob")[0].innerHTML = "Resume";
    } else if (value === "Resume") {
      //resume to counting time
      //continue the time
      setInterval(getCurrentTime, 1000);
      //resume the stopwatch
      $("#duration").stopwatch("start");
      $("#stopwatch").stopwatch("start");
      //change button to "pause" for the next pause
      $("#pauseJob")[0].innerHTML = "Pause Job";
    }
  })

  //AJAX
  setInterval(function(){
    const duration = $("#stopwatch")[0].innerHTML;
    $('#job_duration').val(duration);
    $.post(window.location.href, {
      duration: duration,
      _method: 'put'
    })
  }, 1000);


  $("#finishJob").click(function(){
    $("#stopwatch").stopwatch("toggle");
    $("#duration").stopwatch("toggle");
  })
});
 // clock on display
var clock;
$(document).ready(function () {
  if ($('#clock').length === 0) {
    return;
  }
  // display clock
  clock = new Vue({
      el: '#clock',
      data: {
          time: '',
          date: ''
      }
  });

});

var week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
var timerID = setInterval(updateTime, 1000);
updateTime();
function updateTime() {
    var cd = new Date();
    if (clock) {


    clock.time = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(), 2) + ':' + zeroPadding(cd.getSeconds(), 2);
    clock.date = zeroPadding(cd.getFullYear(), 4) + '-' + zeroPadding(cd.getMonth()+1, 2) + '-' + zeroPadding(cd.getDate(), 2) + ' ' + week[cd.getDay()];
    }
};

function zeroPadding(num, digit) {
    var zero = '';
    for(var i = 0; i < digit; i++) {
        zero += '0';
    }
    return (zero + num).slice(-digit);
}
