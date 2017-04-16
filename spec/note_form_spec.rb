require 'rails_helper'
require_relative '../app/concepts/note/contracts/note_form'

RSpec.describe "something" do
  it "orders by last name" do
    params = {"truck_id"=>"a458931b-6d18-409e-9348-80a4bda1d383",
 "truck_driver_id"=>"ea583f3f-ed5d-4deb-9d0e-1b07820bab84",
 "id"=>"new",
 "clients"=>
  {"0"=>
    {"id"=>"6c89f253-bf8a-4615-b091-e33289a0303d",
     "input_values_attributes"=>
      {"0"=>{"value"=>"aaa", "note_id"=>"ed513a14-771f-49c4-95ac-e89e7265d856"},
       "1"=>{"value"=>"ccc", "note_id"=>"3188e2d7-9224-4f10-ab7c-24bf3c88b08c"}}},
   "1"=>
    {"id"=>"b7ec90a7-7e18-495d-a7eb-26681519f1b3",
     "input_values_attributes"=>
      {"0"=>{"value"=>"111", "note_id"=>"b54bd69b-000b-4957-83e2-ab4dfed89e33"},
       "1"=>{"value"=>"222", "note_id"=>"69204a71-e668-46ed-bcfc-c467f28dbf4f"}}},
   "2"=>
    {"id"=>"e17095b4-2f0f-47e8-8351-7962e8122937",
     "input_values_attributes"=>
      {"0"=>{"value"=>"00f", "note_id"=>"d6b912c7-d040-42bc-ace5-b33dfe8a2d10"},
       "1"=>{"value"=>"fffffffff", "note_id"=>"560954c6-0d61-440d-8ecb-14feb12648fe"}}}}}
    form = ::Note::Contract::NoteForm.new(::Note.new)
    binding.pry
    expect(true).to eq(true)
  end
end
