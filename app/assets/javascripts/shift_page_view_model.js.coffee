# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require knockout

window.App = {}

fakeServerData = {
  positions: ["Server", "Hostess", "Dishwasher"]
  shifts: []
  test: "Kyle"
}

class App.ShiftPageViewModel
  constructor: (data) ->
    @positions = ko.observableArray(data.positions)
    @shifts = ko.observableArray(data.shifts)
    @test = ko.observable(data.test)

class ShiftViewModel
  constructor: (position, startTime, endTime) ->
    @position = ko.observable(position)
    @startTime = ko.observable(startTime)
    @endTime = k.observable(endTime)
