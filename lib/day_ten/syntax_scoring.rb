module DayTen
  class SyntaxScoring
    CLOSE = ['}', ']', '>', ')']
    CLOSE_MAPPING = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
    OPEN = ['{', '[', '<', '(']

    POINTS = {
      ')' => { illegal: 3, incomplete: 1 },
      ']' => { illegal: 57, incomplete: 2 },
      '}' => { illegal: 1197, incomplete: 3 },
      '>' => { illegal: 25137, incomplete: 4 }
    }
    
    REGEX = /(\(\)|\[\]|<>|{})/

    def initialize(lines:)
      @lines = lines
    end

    def part_one
      lines.inject(0) { |sum, line| sum += illegal_points(line) }
    end

    def part_two
      scores = []

      lines.each do |line|
        line = remove_valid_chunks(line)
        scores << completion_points(line) if incomplete?(line)
      end

      scores.sort[scores.count / 2]
    end

    private

    attr_reader :lines

    def illegal_points(line)
      line = remove_valid_chunks(line)
      return 0 if incomplete?(line)

      POINTS[illegal_char(line)][:illegal]
    end

    def remove_valid_chunks(line)
      while matches(line).any?
        matches(line).each { |match| line.gsub!(match, '') }
      end

      line
    end

    def matches(line)
      line.scan(REGEX).uniq.flatten
    end

    def incomplete?(line)
      chars = line.split('')
      chars.all? { |char| opening?(char) } || chars.all? { |char| closing?(char) }
    end

    def opening?(char)
      OPEN.include?(char)
    end

    def closing?(char)
      CLOSE.include?(char)
    end

    def illegal_char(line)
      chars = line.split('')
      chars.find.with_index do |char, index|
        opening?(chars[index - 1]) && closing?(char) unless index.zero?
      end
    end
    
    def completion_points(line)
      line
        .split('')
        .reverse
        .map { |char| CLOSE_MAPPING[char] }
        .inject(0) { |sum, char| sum * 5 + POINTS[char][:incomplete] }
    end
  end
end
