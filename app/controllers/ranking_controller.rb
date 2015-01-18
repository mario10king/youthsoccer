class RankingController < ApplicationController
  def teams
  end
  def ranking
    age = params[:age]
    if params[:league] == "coast"
      @teams = Team.where(age: age, league_id: "3").order(ppg: :desc)
    elsif params[:league] == "scsdl"
      @teams = Team.where(age: age, league_id: "1").order(ppg: :desc)
    else
      @teams = Team.where(age: age).order(ppg: :desc)
    end
    render "ranking/coast"
  end
end