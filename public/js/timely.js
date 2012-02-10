(function($) {
  $(document).ready(function() {

    if ($('.timer').length > 0) {
      var timer_config = $('.timer').data();
      $('.timer').countdown({
        until: timer_config.timer,
        format: 'dhms',
        layout: '<div class="time_remaining">{d<}<div class="days">{dn} {dl}</div>{d>}{h<}<div class="hours">{hn} {hl}</div>{h>}{m<}<div class="minutes">{mn} {ml}</div>{m>}{s<}<div class="seconds">{snn} {sl}</div>{s>}</div>',
        expiryText: "time&#8217;s up"
      });
    }

    $('#timely').fitText(0.3);
    $('.timer').fitText(0.58);
  });
})(jQuery);
