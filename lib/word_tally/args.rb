# frozen_string_literal: true

class WordTally
  class Args
    attr_accessor :sort, :case, :min_chars, :min_count, :delimiter, :output, :verbose, :debug

    def initialize(sort: :desc, word_case: :lower, min_chars: 1, min_count: 1, delimiter: ' ', output: nil,
                   verbose: false, debug: false)
      @sort = sort
      @case = word_case
      @min_chars = min_chars
      @min_count = min_count
      @delimiter = delimiter
      @output = output
      @verbose = verbose
      @debug = debug
    end

    def []=(attribute, value)
      instance_variable_set("@#{attribute}", value)
    end
  end
end
