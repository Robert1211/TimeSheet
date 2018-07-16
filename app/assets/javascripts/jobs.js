$(document).ready(function () {
  const startTime = $('#stopwatch').data('start') * 1000;
  $('#stopwatch').stopwatch({startTime: parseInt(startTime)}).stopwatch('start');
});
