$ ->
  $('.button-play').on 'click', ->
    $('audio')[0].pause()
    $('audio')[0].currentTime = 0
    $('.button-play').removeClass('active')
    $('.button-pause').removeClass('active')
    $(this).blur().addClass('active')
    $(this).closest('.btn-group').siblings('audio')[0].play()

  $('.button-pause').on 'click', ->
    $('.button-pause').removeClass('active')
    $('.button-play').removeClass('active')
    $(this).blur().addClass('active')
    $(this).closest('.btn-group').siblings('audio')[0].pause()

  $('.button-stop').on 'click', ->
    $('.button-pause').removeClass('active')
    $('.button-play').removeClass('active')
    $(this).blur()
    $(this).closest('.btn-group').siblings('audio')[0].pause()
    $(this).closest('.btn-group').siblings('audio')[0].currentTime = 0
