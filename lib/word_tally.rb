# frozen_string_literal: true

require_relative 'word_tally/version'

class WordTally
  attr_reader :tally, :count, :uniq_count, :avg

  def initialize(input, format: :lower, order: :desc, min_chars: 1, min_count: 1)
    tally_map = tally_map(input, format, min_chars)
    tally_map.filter! { |_word, count| count >= min_count } if min_count > 1
    @count = tally_map.values.sum
    @tally = tally_map.to_a
    @uniq_count = @tally.size
    @avg = @count.positive? && @count.fdiv(@uniq_count)

    sort(order)
  end

  def sort(order)
    case order
    in :desc
      @tally.sort_by! { |_word, count| -count }
    in :asc
      @tally.sort_by! { |_word, count| count }
    in :unsorted
      nil
    end
  end

  private

  def tally_map(input, format, min_chars)
    tally = Hash.new(0)

    input.each_line(chomp: true) do |line|
      words = normalize(line, format).split(/\b/).grep(/[[:alnum:]]/)
      words.filter! { |word| word.size >= min_chars } if min_chars > 1

      words.each { |word| tally[word] += 1 }
    end

    tally
  end

  def normalize(text, format)
    case format
    in :lower
      text.downcase
    in :upper
      text.upcase
    in :original
      text
    end
  end
end
