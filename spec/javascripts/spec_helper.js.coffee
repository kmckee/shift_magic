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
            message: "expected #{actual} to be same moment as #{expected}"
          }
      }
