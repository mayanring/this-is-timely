(function($) {
  $(document).ready(function() {

    if ($('.timer').length > 0) {
      var timer_config = $('.timer').data();
      $('.timer').countdown({
        until: timer_config.timer,
        format: 'dhms',
        layout: '<div class="time_remaining">{d<}<div class="days">{dn} {dl}</div>{d>}{h<}<div class="hours">{hn} {hl}</div>{h>}{m<}<div class="minutes">{mn} {ml}</div>{m>}{s<}<div class="seconds">{snn} {sl}</div>{s>}</div>',
        expiryText: "time&#8217;s up",
        onExpiry: function() {
          $('#alarm').get(0).play();
          $('.return').addClass('reveal');
        }
      });
    }

    $('#timely').fitText(0.315);
    $('#about_timely').fitText(0.56);
    $('.timer').fitText(0.58);
    $('.error_code').fitText(0.17);
  });
})(jQuery);
