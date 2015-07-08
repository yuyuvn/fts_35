jQuery ->
  secondsToTime = (secs) ->
    secs = Math.round(secs);
    hours = Math.floor(secs / (60 * 60));

    divisor_for_minutes = secs % (60 * 60);
    minutes = Math.floor(divisor_for_minutes / 60);

    divisor_for_seconds = divisor_for_minutes % 60;
    seconds = Math.ceil(divisor_for_seconds);

    return hours + ":" + minutes + ":" + seconds;

  if $("#exam_finished").val() == "true"
    countdown = $("#exam_time")
    countdown.html(secondsToTime(parseInt(countdown.attr("data-timeleft"))))
    $("#question_form input").prop("disabled", true)
  else
    tick = ->
      countdown = $("#exam_time")
      time = parseInt(countdown.attr("data-timeleft"))
      countdown.html(secondsToTime(time))
      countdown.attr("data-timeleft", time-1)
      $("#question_form").submit() if time <= 0
    tick()
    setInterval tick, 1000
