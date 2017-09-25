# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('#song_album_id').parent().hide()
    albumes = $('#song_album_id').html()
    $('#song_artist_id').change ->
        artista = $('#song_artist_id :selected').text()
        escaped_artist = artista.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g,'\\$1')
        options = $(albumes).filter("optgroup[label='#{escaped_artist}']").html()
        if options
            $('#song_album_id').html(options)
            $('#song_album_id').parent().show()
        else
            $('#song_album_id').empty()
            $('#song_album_id').parent().hide()