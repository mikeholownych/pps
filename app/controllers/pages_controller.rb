class PagesController < ApplicationController
  def show
    @page = Page.published.friendly.find(params[:id])

    if request.path != page_path(@page)
      redirect_to @page, status: :moved_permanently
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @page }
      end
    end
  end
end
