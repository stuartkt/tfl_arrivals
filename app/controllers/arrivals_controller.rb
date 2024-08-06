# frozen_string_literal: true

class ArrivalsController < ApplicationController
  def index
    @arrivals = fetch_arrivals
    respond_to do |format|
      format.html
      format.turbo_stream { render :index }
    end
  end

  private

  def fetch_arrivals
    TflService.fetch_arrivals
              .sort_by { |train| [train['platformName'], train['timeToStation']] }
              .group_by { |train| train['platformName'] }
  end
end
