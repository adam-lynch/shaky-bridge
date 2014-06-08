midi = null

onMessage = (event) ->
  data = event.data

  $('#events').prepend """
    <li>
      <ul>
        <li>#{data[0]}</li>
        <li>\##{data[1]}</li>
        <li>#{(data[2]/127)*100}%</li>
      </ul>
    </li>
  """

onSuccess = (access, options) ->
  midi = access
  inputs =  midi.inputs()
  inputs.forEach (input) ->
    console.debug input
    $('body').append "<p>Connected: #{input.name}</p>"
    input.onmidimessage = onMessage

onError = (error) ->
  alert 'err'
  console.debug error

navigator.requestMIDIAccess().then onSuccess, onError