module Sixel
  def self.build(image, palette = 256.times.map{_1*0x10101})
    header = "\ePq"
    footer = "\e\\"
    color_table = palette.map.with_index do |color, idx|
      r, g, b = 3.times.map { ((color >> (16 - 8 * _1) & 0xff) * 100 / 255.0).round }
      "##{idx};2;#{r};#{g};#{b}"
    end
    h = image.size
    w = image.first.size
    sixel_lines = (h.fdiv(6).ceil).times.map { {} }
    h.times do |y|
      w.times do |x|
        color = image[y][x]
        (sixel_lines[y / 6][color] ||= Hash.new(0))[x] |= 1 << (y % 6)
      end
    end
    output = [header, color_table]
    sixel_lines.each do |line|
      linedata = []
      line.each do |color, bitmasks|
        linedata << '$' unless linedata.empty?
        linedata << "##{color}"
        prev_x = -1
        bitmasks.sort_by{_1}.each do |x, bitmask|
          linedata << (prev_x + 2 == x ? '?' : "!#{x - prev_x - 1}?") if prev_x + 1 < x
          linedata << (63 + bitmask).chr
          prev_x = x
        end
      end
      output << linedata << '-'
    end
    [output, footer].join
  end
end
