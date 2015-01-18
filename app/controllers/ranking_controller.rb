class RankingController < ApplicationController
  def index
  end
  def show
    @age = params[:age]
    @league = params[:league]
    if @league == "coast"
      @teams = Team.where(age: @age, league_id: "3").order(ppg: :desc)
    elsif @league == "scsdl"
      @teams = Team.where(age: @age, league_id: "1").order(ppg: :desc)
    else
      @teams = Team.where(age: @age).order(ppg: :desc)
    end
  end
end