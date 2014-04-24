#= require jquery
#= require knockout

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
