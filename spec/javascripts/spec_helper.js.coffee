#= require jquery
#= require knockout
#= require moment

beforeEach ->
  jasmine.addMatchers
    toBeInstanceOf: ->
      return {
        compare: (actual, expected) ->
          return {
            pass: actual instanceof expected
            message: "expected #{actual} to be instance of #{expected.name}"
          }
      }
    toBeSameMomentAs: ->
      return {
        compare: (actual, expected) ->
          return {
            pass: actual.isSame(expected)
            message: "expected #{actual.format("HH:mm:ss")} to be same moment as #{expected.format("HH:mm:ss")}"
          }
      }
    toBeTime: ->
      return {
        compare: (actual, expected) ->
          return {
            pass: actual.format('HH:mm:ss') == expected
            message: "expected #{actual.format("HH:mm:ss")} to be same time as #{expected}"
          }
      }
