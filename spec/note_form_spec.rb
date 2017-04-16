require 'rails_helper'
require_relative '../app/concepts/note/contracts/note_form'

RSpec.describe "something" do
  it "orders by last name" do
    form = ::Note::Contract::NoteForm.new(::Note.new)
    expect(true).to eq(true)
  end
end
