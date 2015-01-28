$ ->
  $('.listen-speaking').on 'click',(e) ->
    e.preventDefault()
    $(this).siblings('.audio-buttons').find('.example-audio').fadeIn('slow')
    $(this).remove()