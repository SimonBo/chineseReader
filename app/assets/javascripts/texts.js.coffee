$ ->
  character = $(".character")
  text = $('#text')
  original_font_size = text.css('font-size')
  $("#font-inc").on 'click', (e) ->
    e.preventDefault;
    font_size = text.css('font-size').replace('px', '')
    inc_font_size = parseInt(font_size) + 1 + 'px'
    text.css('font-size', inc_font_size )

  $("#font-dec").on 'click', (e) ->
    e.preventDefault;
    font_size = text.css('font-size').replace('px', '')
    dec_font_size = parseInt(font_size) - 1 + 'px'
    text.css('font-size', dec_font_size )

  $("#font-reset").on 'click', (e) ->
    e.preventDefault;
    text.css('font-size', original_font_size )

  character.on 'click', (e) ->
    target_word = $(this).data('index')
    target_text = $('#text').data('id')
    $.ajax
      type: 'GET'
      url: "/words/find/#{target_word}/#{target_text}"
      dataType: "json"
      error: (jqXHR, textStatus, errorThrown) ->
        $('#notice').text("AJAX Error: #{textStatus}") 
      success: (data, textStatus, jqXHR) ->
        console.log data[0].simplified_char
        $('#notice').text()
        if data.length >0
          checked_word = data[0].id
          $.ajax
            type: 'GET'
            url: "/checked_words/mark_as_checked/#{checked_word}"
            dataType: "json"


          $('#character').html("<strong>Character: </strong>")
          $('#pronunciation').html("<strong>Pinyin: </strong>")
          $('#meaning').html("<strong>Meaning: </strong>")
          $('#character').append(data[0].simplified_char)
          pinyin = PinyinConverter.convert(data[0].pronunciation).toString().replace(/[\][]/g, '')
          $('#pronunciation').append(pinyin)
          meanings = data[0].meaning.split '/'
          for chunk in meanings
            $('#meaning').append chunk
            $('#meaning').append '<br>'
        else
          $('#character').text('Not found')
          $('#pronunciation').text('')
          $('#meaning').text('')

