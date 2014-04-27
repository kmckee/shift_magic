#= require spec_helper
#= require shift_view_model

describe 'App.ShiftViewModel', ->
  beforeEach ->
    @sampleData =
      position: 'Server'
      startTime: '08:00:00'
      endTime: '13:00:00'

  it 'has a position', ->
    @sampleData.position = 'Waiter'
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.position()).toBe('Waiter')

  it 'has a start time', ->
    @sampleData.startTime = '14:00:00'
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.startTime()).toBeSameMomentAs(moment('14:00:00', 'H'))

  it 'has an end time', ->
    @sampleData.endTime = '10:00:00'
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.endTime()).toBeSameMomentAs(moment('10:00:00', 'H'))

  it 'knows the template duration in minutes', ->
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.templateDurationInMinutes()).toBe(24*60)

  describe 'calculating the left side as a percentage', ->
    it 'is 0 for a shift starting at midnight', ->
      @sampleData.startTime = '00:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.leftSidePercentage()).toBe(0)

    it 'is 50 for a shift starting at noon', ->
      @sampleData.startTime = '12:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.leftSidePercentage()).toBe(50)
