require 'spec_helper'

describe TraktApi  do
  #use_vcr_cassette

  let(:trakt) do
    TraktApi::Trakt.new(user:'aftakitani',api_key:'xxxxxx')
  end

  xit "lists the user's watched shows" do

    trakt.watched_shows.class.should == Array
  end

  xit "lists the user's watched shows" do
    trakt.watched_movies
  end

  xit "lists the user's unwatched movies" do
    trakt.unwatched_movies
  end


end
