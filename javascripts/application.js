(function() {

  $(document).ready(function() {
    var element, fileUrl;
    element = $("#jpId");
    fileUrl = element.attr('data-file');
    return element.jPlayer({
      swfPath: '/vendor/jplayer/Jplayer.swf',
      ready: function() {
        return $(this).jPlayer("setMedia", {
          mp3: fileUrl
        });
      }
    });
  });

}).call(this);
