$ ->
  $(".character").on 'click', (e) ->
    target_word = $(this).data('index')
    target_text = $('#text').data('id')
    $.ajax
      type: 'GET'
      url: "/words/find/#{target_word}/#{target_text}"
      dataType: "json"
      error: (jqXHR, textStatus, errorThrown) ->
        $('#notice').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        console.log data
        if data.length >0
          $('#character').text("#{target_word} ")
          $('#pronunciation').text(data[0].pronunciation)
          $('#meaning').text(data[0].meaning)
        else
          $('#character').text('Not found')
          $('#pronunciation').text('')
          $('#meaning').text('')

