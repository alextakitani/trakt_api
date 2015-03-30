require 'spec_helper'

describe TraktApi::User do

  let(:user) { TraktApi::User.new(user_id:ENV['TRAKT_USER'], password: ENV['TRAKT_PASSWORD'] , api_key:ENV['TRAKT_API_KEY'] , api_secret: ENV['TRAKT_API_SECRET']) }

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

    let(:unwatched_movies) {user.unwatched_movies}

    it "returns the user's not watched movies" do
      unwatched_movies.should be_a(Array)
    end

    it "should be an Movie" do
      unwatched_movies.first.should be_a(TraktApi::Movie)
    end

  end


end