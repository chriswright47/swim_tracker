class MeetPdfGenerator
  attr_reader :meet, :options

  def initialize(meet:, options: {})
    @meet = meet
    @options = options
  end

  def render!
    pdf = Prawn::Document.new
    pdf.repeat(:all) do
      pdf.draw_text meet.title, :at => pdf.bounds.top_left, :size => 20
    end

    meet.heats.each do |heat|
      add_page_break_if_heat_will_overflow(pdf, heat)
      pdf.pad_top(20) { pdf.text heat.display_name }
      pdf.table(
        table_data(heat),
        :width => 500,
        :cell_style => {:height => 25}
      )
    end
    pdf.render
  end

  private

  def table_data(heat)
    data = []
    if heat.meet.final?
      heat.swims.each_with_index do |swim, index|
        data << swim_row(swim, heat, index)
      end
    else
      heat.entry_limit.times do |index|
        data << swim_row(heat.swims[index], heat, index)
      end
    end

    data.try(:presence) || [['no results']]
  end

  def swim_row(swim, heat, index)
    splits = swim.try(:display_final_time) || Array.new(heat.event.split_count,'')
    number = heat.event.relay ? index % 4 + 1 : index + 1
    ["#{number}. #{swim.try(:display_athlete)}", splits].flatten
  end

  def add_page_break_if_heat_will_overflow(pdf, heat)
    row_count = heat.meet.final? ? heat.swims.count : heat.entry_limit
    table_height = row_count * 25 + 50
    pdf.start_new_page if table_height > pdf.y
  end
end
