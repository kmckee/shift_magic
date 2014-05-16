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

    @leftPixelOffset = ko.computed =>
      minutesBetweenTimeAndTemplateStart = @startTime().diff(@templateStartTime(), 'minutes')
      ratio = minutesBetweenTimeAndTemplateStart / @templateDurationInMinutes()
      Math.round(@maximumWidth() * ratio)
    
    @rightSidePercentage = ko.computed =>
      @_calculatePercentageForTime(@endTime())

  _calculatePercentageForTime: (time) ->
    minutesBetweenTimeAndTemplateStart = time.diff(@templateStartTime(), 'minutes')
    ratio = minutesBetweenTimeAndTemplateStart / @templateDurationInMinutes()
    rounded = Math.round(ratio * 100)



