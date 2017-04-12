class Client
  class Cell
    class New < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey
    end
  end
end
