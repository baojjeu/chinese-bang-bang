$ ->
  speakingAudio = $('.speaking-audio')[0]

  $('.button-play').on 'click', ->
    $('.button-play').blur()
                     .addClass('active')
    $('.button-pause').removeClass('active')
    speakingAudio.play()

  $('.button-pause').on 'click', ->
    $('.button-pause').blur()
                      .addClass('active')
    $('.button-play').removeClass('active')
    speakingAudio.pause()

  $('.button-stop').on 'click', ->
    $('.button-stop').blur()
    $('.button-play').removeClass('active')
    $('.button-pause').removeClass('active')
    speakingAudio.pause()
    speakingAudio.currentTime = 0
