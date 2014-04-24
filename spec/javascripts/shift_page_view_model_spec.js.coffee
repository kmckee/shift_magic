# include spec/javascripts/helpers/some_helper_file.js and app/assets/javascripts/foo.js
#= require jquery
#= require knockout 
#= require shift_page_view_model
describe 'ShiftPageViewModel', ->
  beforeEach ->
    @sampleData = {
      positions: ["Server", "Hostess", "Dishwasher"]
      shifts: []
      test: "Kyle"
    }

  it 'has a list of available positions', ->
    @sampleData.positions = ["Server", "Hostess"]
    viewModel = new App.ShiftPageViewModel(@sampleData)
    expect(viewModel.positions().length).toBe(2)
