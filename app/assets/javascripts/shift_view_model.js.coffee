#= require jquery
#= require knockout
#= require knockout.mapping
#= require moment

window.App ?= {}

class App.ShiftViewModel
  constructor: (data) ->
    twentyFourHourTime = 'HH:mm:ss'
    displayTime = 'h:mm a'
    @position = ko.observable(data.position)
    @startTime = ko.observable(moment(data.startTime, twentyFourHourTime))
    @startTimeFormatted = ko.computed =>
      @startTime().format(displayTime)
    @endTime = ko.observable(moment(data.endTime, twentyFourHourTime))
    @endTimeFormatted = ko.computed =>
      @endTime().format(displayTime)
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
        newMoment = moment(@templateStartTime()).add('minutes', elapsedMinutes)
        @startTime(newMoment)
    }
    
    @widthInPixels = ko.computed {
      read: =>
        ratio = @_getDurationInMinutes(@startTime, @endTime) / @templateDurationInMinutes()
        Math.round(@maximumWidth() * ratio)
      write: (value) =>
        minutesPerPixel = @templateDurationInMinutes() / @maximumWidth()
        durationInMinutes = Math.round(minutesPerPixel * value)
        newMoment = moment(@startTime()).add('minutes', durationInMinutes)
        @endTime(newMoment)
    }

  updateShiftDuration: (uiElement) =>
    leftPixels = parseInt(uiElement.css('left'), 10)
    @leftPixelOffset(leftPixels)
    widthPixels = parseInt(uiElement.css('width'), 10)
    @widthInPixels(widthPixels)

  _getDurationInMinutes: (start, end) ->
    end().diff(start(), 'minutes')
