#= require spec_helper
#= require shift_page_view_model

describe 'App.ShiftPageViewModel', ->
  beforeEach ->
    @sampleData =
      positions: ["Server", "Hostess", "Dishwasher"]
      shifts: []
      test: "Kyle"
    @sampleShift =
      position: "Server"
      startTime: "08:00:00"
      endTime: "13:00:00"

  it 'has a list of available positions', ->
    @sampleData.positions = ["Server", "Hostess"]
    viewModel = new App.ShiftPageViewModel(@sampleData)
    expect(viewModel.positions().length).toBe(2)
  
  it 'includes the correct positions', ->
    @sampleData.positions = ["Server"]
    viewModel = new App.ShiftPageViewModel(@sampleData)
    expect(viewModel.positions()).toContain("Server")

  it 'has shifts', ->
    @sampleData.shifts = [@sampleShift]
    viewModel = new App.ShiftPageViewModel(@sampleData)
    expect(viewModel.shifts().length).toBe(1)

  it 'maps the shifts to ShiftViewModels', ->
    @sampleData.shifts = [@sampleShift]
    viewModel = new App.ShiftPageViewModel(@sampleData)
    expect(viewModel.shifts.pop()).toBeInstanceOf(App.ShiftViewModel)
