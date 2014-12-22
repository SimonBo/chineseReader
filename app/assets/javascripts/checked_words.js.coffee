# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
TestMaker=
  check_answer: (selection) ->
    right_pronunciation = $('#word_id').data('id')
    if selection == right_pronunciation
      $('#notice').text('Yay!')
    else
      alert 'Dupa'


ready = ->
  pronunciation_option = $('.pronunciation-option')

  pronunciation_option.on 'click', ->
    check_id = $(this).data('id')
    TestMaker.check_answer(check_id)

  pronunciation_option.hover (e) -> $(this).toggleClass('pronunciation-highlight')
    
$(document).ready(ready)
$(document).on('page:load', ready)