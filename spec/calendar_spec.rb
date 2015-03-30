require 'spec_helper'

describe TraktApi::Calendar, :vcr do

  let(:calendar) { TraktApi::Calendar.new(user_id:ENV['TRAKT_USER'], token: ENV['TRAKT_PASSWORD'] , api_key:ENV['TRAKT_API_KEY']) }

  it ".episodes" do
    binding.pry
    calendar.episodes.should be_a(Array)
  end

  it "episode should be an Episode class" do
    calendar.episodes.first.class.should == TraktApi::Episode
  end

end

