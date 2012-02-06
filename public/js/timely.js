(function($) {
  $(document).ready(function() {

    if ($('.timer').length > 0) {
      var timer_config = $('.timer').data();
      $('.timer').countdown({
        until: timer_config.timer,
        format: 'dhms',
        layout: '<div class="time_remaining">{d<}<div class="days">{dn} days</div>{d>}{h<}<div class="hours">{hn} hours</div>{h>}{m<}<div class="minutes">{mn} minutes</div>{m>}{s<}<div class="seconds">{sn} seconds</div>{s>}</div>'
      });
    }

    $('#timely').fitText(0.3);
    $('.timer').fitText(0.58);
  });
})(jQuery);
