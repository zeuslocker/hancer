class Client
  class Cell
    class New < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey
      include TrailblazerHelpers::Cells::ResultObject
    end
  end
end
