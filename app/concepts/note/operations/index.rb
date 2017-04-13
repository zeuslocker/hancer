class Note
  class Index < Trailblazer::Operation
    step TrailblazerHelpers::Steps::Note::SetupNotes
    step :order_points

    def order_points(options, **)
      options['notes'].order!(created_at: :desc)
    end
  end
end
