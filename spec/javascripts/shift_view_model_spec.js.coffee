#= require jquery
#= require spec_helper
#= require shift_view_model

describe 'App.ShiftViewModel', ->
  beforeEach ->
    @sampleData =
      position: 'Server'
      startTime: '08:00:00'
      endTime: '13:00:00'
    @twentyFourHourTime = 'HH:mm:ss'
    $.fn.width = -> 200

  it 'has a position', ->
    @sampleData.position = 'Waiter'
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.position()).toBe('Waiter')

  it 'has a start time', ->
    @sampleData.startTime = '14:00:00'
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.startTime()).toBeSameMomentAs(moment('14:00:00', @twentyFourHourTime))

  it 'has an end time', ->
    @sampleData.endTime = '10:00:00'
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.endTime()).toBeSameMomentAs(moment('10:00:00', @twentyFourHourTime))

  it 'knows the template duration in minutes', ->
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.templateDurationInMinutes()).toBe(24*60)

  it 'knows the maximum width a shift can be displayed as', ->
    viewModel = new App.ShiftViewModel(@sampleData)
    expect(viewModel.maximumWidth()).toBe(200)

  describe 'calculating the left side as a pixel offset', ->
    it 'is 0 for a shift starting at midnight', ->
      @sampleData.startTime = '00:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.leftPixelOffset()).toBe(0)

    it 'is 100 for a shift starting at noon with a maximum width of 200', ->
      @sampleData.startTime = '12:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.leftPixelOffset()).toBe(100)

    it 'takes minutes into account', ->
      @sampleData.startTime = '12:59:59'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.leftPixelOffset()).toBeGreaterThan(100)

    it 'rounds to a whole number', ->
      @sampleData.startTime = '08:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.leftPixelOffset()).toBe(67)

  describe 'setting the left side as a pixel offset', ->
    it 'changes the start time to midnight when it is 0', ->
      viewModel = new App.ShiftViewModel(@sampleData)
      viewModel.leftPixelOffset(0)
      expect(viewModel.startTime()).toBeSameMomentAs(moment('00:00:00', @twentyFourHourTime))

    it 'changes the start time to noon when it is half the maximum width', ->
      viewModel = new App.ShiftViewModel(@sampleData)
      viewModel.leftPixelOffset(100)
      expect(viewModel.startTime()).toBeSameMomentAs(moment('12:00:00', @twentyFourHourTime))

    it 'rounds down to the nearest minute', ->
      viewModel = new App.ShiftViewModel(@sampleData)
      viewModel.leftPixelOffset(1)
      expect(viewModel.startTime()).toBeTime('00:07:00')
    
    it 'rounds up to the nearest minute', ->
      viewModel = new App.ShiftViewModel(@sampleData)
      viewModel.leftPixelOffset(3)
      expect(viewModel.startTime()).toBeTime('00:22:00')


  describe 'calculating the width in pixels', ->
    it 'is 200 for a shift ending at midnight with a maximum width of 200', ->
      @sampleData.startTime = '00:00:00'
      @sampleData.endTime = '24:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.widthInPixels()).toBe(200)

    it 'is 100 for a shift ending at noon with a maximum width of 200 and a start time at midnight', ->
      @sampleData.startTime = '00:00:00'
      @sampleData.endTime = '12:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.widthInPixels()).toBe(100)

    it 'is 150 for a shift ending at noon with a maximum width of 200 and a start time at midnight', ->
      @sampleData.startTime = '00:00:00'
      @sampleData.endTime = '18:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.widthInPixels()).toBe(150)
    
    it 'takes minutes into account', ->
      @sampleData.startTime = '00:00:00'
      @sampleData.endTime = '12:59:59'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.widthInPixels()).toBeGreaterThan(100)

    it 'rounds to whole numbers only', ->
      @sampleData.startTime = '00:00:00'
      @sampleData.endTime = '08:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      expect(viewModel.widthInPixels()).toBe(67)

  describe 'setting the width in pixels', ->
    it 'is midnight when set to the maximum width', ->
      @sampleData.startTime = '00:00:00'
      viewModel = new App.ShiftViewModel(@sampleData)
      viewModel.widthInPixels(200)
      expect(viewModel.endTime()).toBeTime('23:59:59')
