#= require jquery
#= require knockout
#= require knockout.mapping
#= require moment

window.App ?= {}

class App.ShiftViewModel
  constructor: (data) ->
    twentyFourHourTime = 'HH:mm:ss'
    @position = ko.observable(data.position)
    @startTime = ko.observable(moment(data.startTime, twentyFourHourTime))
    @endTime = ko.observable(moment(data.endTime, twentyFourHourTime))
    @templateStartTime = ko.observable(moment('00:00:00', twentyFourHourTime))
    @templateEndTime = ko.observable(moment('23:59:59', twentyFourHourTime))
    @templateDurationInMinutes = ko.observable(24*60)
    
    @maximumWidth = ko.computed ->
      $("#shifts").width()

    @leftPixelOffset = ko.computed {
      read: =>
        ratio = @_getDurationInMinutes(@templateStartTime, @startTime) / @templateDurationInMinutes()
        Math.round(@maximumWidth() * ratio)
      write: (value) =>
        ratio = value / @maximumWidth()
        elapsedMinutes = Math.round(@templateDurationInMinutes() * ratio)
        newMoment = @templateStartTime().add('minutes', elapsedMinutes)
        @startTime(newMoment)
    }
    
    @widthInPixels = ko.computed =>
      ratio = @_getDurationInMinutes(@startTime, @endTime) / @templateDurationInMinutes()
      Math.round(@maximumWidth() * ratio)

  _getDurationInMinutes: (start, end) ->
    end().diff(start(), 'minutes')
