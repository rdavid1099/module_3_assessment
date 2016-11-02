class SearchesController < ApplicationController
  def index
    @stores = Store.all_by_zipcode(params[:zipcode])
    @zipcode = params[:zipcode]
  end
end
