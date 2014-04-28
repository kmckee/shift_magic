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
    @templateDurationInMinutes = ko.observable(24*60)
    @templateStartTime = ko.observable(moment('00:00:00', twentyFourHourTime))
    
    @leftSidePercentage = ko.computed =>
      minutesFromTemplateStartToShiftStart =
        @startTime().diff(@templateStartTime(), 'minutes')
      startRatio = minutesFromTemplateStartToShiftStart / @templateDurationInMinutes()
      startPercentage = startRatio * 100.00
      rounded = Math.round(startPercentage)
