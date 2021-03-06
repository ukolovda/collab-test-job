$(document).on 'turbolinks:load',  ->
  s = $('input.word_search')
  if s.length > 0
    s.autocomplete
      source: (term, callback)->
        $.ajax
          url: '/autocomplete/words.json'
          data:
            term
          dataType: "json"
          success: (data)->
            if data.length == 0
              data = [{value: 'NO_DATA', label: 'No such rows'}]
            callback data
          error: (jqXHR, textStatus, errorThrown)->
            data = [{value: 'NO_DATA', label: "Error: #{errorThrown}"}]
            callback data
      delay: 500
      minLength: 1
      search: (event, ui) ->
        $('.global_contact_search_indicator').show()
      response: (event, ui) ->
        $('.global_contact_search_indicator').hide()
      select: (event, ui)->
        $(this).val('')
        word = ui.item.value
        console.log word
        unless word == 'NO_DATA'
          $.ajax
            url: '/words.js'
            method: 'post'
            data:
              word: ui.item.value
            dataType: 'script'
        false
    .data( "ui-autocomplete" )._renderItem =  ( ul, item )->
      if item.value=='NO_DATA'
        $li = $("<li>")
        $li.text item.label
      else
        $a = $("<a>")
        $a.text item.value
        $a.data 'value', item.value
        $li = $("<li>").append $a
      $li.appendTo(ul)