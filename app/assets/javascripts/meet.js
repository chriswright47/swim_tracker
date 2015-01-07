$(function() {
  console.log('hello, world');
  $('.heat-item').on('click', function() {
    $('.heat-item').removeClass('active');
    $(this).addClass('active');
    var heatId = $(this).data('heat-id');
    var heatPath = '/heats/' + heatId;

    $.ajax({
      type: 'GET',
      url: heatPath
    }).done(function(response) {
      $('.edit-heat-view').html(response.attachmentPartial);
      $('.swimmer-select').select2({
        placeholder: 'Select an athlete...',
        allowClear: true
      });
      window.scrollTo(0,0);
    });
  });
});