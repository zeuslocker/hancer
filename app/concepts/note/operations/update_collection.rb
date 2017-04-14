class Note
  class UpdateCollection < Trailblazer::Operation
    success :check

    def check(options, params:, **)
      binding.pry
    end
  end
end
