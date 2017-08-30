class TableFormater

  class << self
    def format(slots)
      collection = build_collection(slots)
      build_columns(collection)
      out = write_divider
      out << write_header
      out << write_divider
      collection.map { |h| out << write_line(h) }
      out << write_divider
    end

    def write_header
      "| #{ @columns.map { |_, g| g[:label].ljust(g[:width]) }.join(' | ') } |\n"
    end

    def write_divider
      "+-#{ @columns.map { |_, g| '-'*g[:width] }.join("-+-") }-+\n"
    end

    def write_line(h)
      str = h.keys.map { |k| h[k].to_s.ljust(@columns[k][:width]) }.join(" | ")
      "| #{str} |\n"
    end

    def build_collection(slots)
      arr = slots.map do |slot|
        { position: slot.position,
          number: (slot.car&.number || '-'),
          colour: (slot.car&.colour || '-') }
      end
    end

    def build_columns(arr)
      @columns ||= col_labels.each_with_object({}) do |(col, label), h|
        h[col] = { label: label,
                   width: [arr.map { |g|
                     g[col].size
                   }.max, label.size].max
        }
      end
    end

    def col_labels
      { position: "Slot No.", number: "Registration No.", colour: "Colour" }
    end
  end
end
