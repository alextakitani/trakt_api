require 'spec_helper'

describe TraktApi::User do

  let(:user) { TraktApi::User.new(user_id:'aftakitani', password: 'xxx' , api_key:'xxx' , api_secret: 'xxx') }

  describe ".calendar" do

    it "returns the user show calendar" do
      user.calendar.should be_a(TraktApi::Calendar)
    end

  end

  describe ".watched_shows"  do
    it "returns the user's whatched shows" do
      user.watched_shows.should be_a(Array)
    end

    it "should be an Show" do
      user.watched_shows.first.should be_a(TraktApi::Show)
    end

  end

  describe ".watched_movies"  do
    it "returns the user's whatched movies" do
      user.watched_movies.should be_a(Array)
    end

    it "should be an Movie" do
      user.watched_movies.first.should be_a(TraktApi::Movie)
    end

  end

  describe ".unwatched_movies"  do
    it "returns the user's not whatched movies" do

      user.unwatched_movies.should be_a(Array)
    end

    it "should be an Movie" do
      user.unwatched_movies.first.should be_a(TraktApi::Movie)
    end

  end


end