module DayFour
  class GiantSquid
    def initialize(boards:, numbers:)
      @boards = boards
      @numbers = numbers
    end

    def part_one
      current_boards = convert_boards_to_objects
      winning_board = nil
      winning_number = nil

      numbers.each do |number|
        current_boards = mark_boards(current_boards, number)
        winning_board = winning_board(current_boards, number)
        break winning_number = number if winning_board
      end

      final_score(winning_board, winning_number)
    end

    def part_two
      current_boards = convert_boards_to_objects
      last_to_win_board = nil
      last_to_win_number = nil

      numbers.each do |number|
        current_boards = mark_boards(current_boards, number)
        winning_boards = winning_boards(current_boards, number)
        current_boards -= winning_boards
        if current_boards.count.zero?
          last_to_win_board = winning_boards.first 
          last_to_win_number = number 
          break
        end
      end

      final_score(last_to_win_board, last_to_win_number)
    end

    private

    attr_reader :boards, :numbers

    def convert_boards_to_objects
      boards.map do |board|
        rows = board.split("\n")
        {}.tap do |object|
          rows.each_with_index do |row, row_index|
            row.split.each_with_index do |row_number, column_index|
              object[row_number] = { column: column_index, drawn?: false, row: row_index }
            end
          end
        end
      end
    end

    def mark_boards(current_boards, number)
      current_boards.map do |board|
        board[number][:drawn?] = true if board[number]
        board
      end
    end

    def winning_board(current_boards, number)
      current_boards.find { |board| won?(board, number) }
    end

    def won?(board, number)
      return false unless board[number]

      bingo?(board, :column, number) || bingo?(board, :row, number)
    end

    def bingo?(board, direction, number)
      index = board[number][direction]
      drawn = board.select { |k, v| v[direction] == index && v[:drawn?] }
      drawn.count == 5
    end

    def winning_boards(current_boards, number)
      current_boards.select { |board| won?(board, number) }
    end

    def final_score(board, number)
      board.reject { |k, v| v[:drawn?] }.keys.map(&:to_i).sum * number.to_i
    end
  end
end
