// $(document).on('turbolinks:load', function() {
//   $('#search-form').submit(function(event) {
//     event.preventDefault();
//     var query = $('#query').val();

//     $.ajax({
//       type: 'POST',
//       url: '/search',
//       data: { query: query },
//       dataType: 'script',
//       success: function() {
//         console.log('success');
//       },
//       error: function() {
//         console.log('error');
//       }
//     });
//   });
//   // $('#search-results').html("<%= j render 'search' %>");
//       // $(document).on('ajax:success', function(event) {
//       //   $('#search-results').html(event.detail[2].responseText);
//       // });
// });



$(document).on('turbolinks:load', function() {
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var query = $('#query').val();

    $.ajax({
      type: 'POST',
      url: '/search',
      data: { query: query },
      dataType: 'script',
      success: function() {
        console.log('success');
      },
      error: function() {
        console.log('error');
      }
    });
  });
});
