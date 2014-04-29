#= require knockout
#= require knockout.mapping
#= require shift_view_model

window.App ?= {}

class App.ShiftPageViewModel
  constructor: (data) ->
    ko.mapping.fromJS(data, shiftMapping, this)
    
  shiftMapping =
    'shifts':
      create: (options) ->
        return new App.ShiftViewModel(options.data)
