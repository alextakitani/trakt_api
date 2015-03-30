require 'spec_helper'

describe TraktApi::Calendar, :vcr do

  let(:calendar) { TraktApi::Calendar.new(user_id:'aftakitani', password: 'xxxx' , api_key:'xxx') }

  it ".episodes" do
    calendar.episodes.should be_a(Array)
  end

  it "episode should be an Episode class" do
    calendar.episodes.first.class.should == TraktApi::Episode
  end

end

