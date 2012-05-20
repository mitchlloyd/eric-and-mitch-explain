$(document).ready ->
  element = $("#jpId")
  fileUrl = element.attr('data-file')
  element.jPlayer {
    swfPath: '/vendor/jplayer/Jplayer.swf'
    ready: ->
      $(this).jPlayer(
        "setMedia",
        {mp3: fileUrl}
      )
  }
