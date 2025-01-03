class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [ :edit, :show, :update, :destroy ]
  layout "portfolio"
  access all: [ :show, :index ], user: { except: [ :destroy, :new, :update, :create, :edit ] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
    # @portfolio_items = Portfolio.where(subtitle: "Ruby on Rails")
    # @portfolio_items = Portfolio.search_by_subtopic("Ruby on Rails")
    # @portfolio_items = Portfolio.ruby_on_rails
    @page_title = "Devcamp Portfolio | My Portfolio Items"
  end

  def react
    @react_portfolio_items = Portfolio.search_by_subtopic("React")
  end

  def ruby_on_rails
    @ror_portfolio_items = Portfolio.ruby_on_rails
  end

  def new
    @portfolio_item = Portfolio.new
    # 3.times {
    #   @portfolio_item.technologies.build
    # }
    @portfolio_item.technologies.build
  end

  def edit
    # @portfolio_item.technologies.build
  end

  def show
    @page_title = @portfolio_item.title
  end

  def create
    # @portfolio_item = Portfolio.new(params.expect(portfolio: [ :title, :subtitle, :body, technologies_attributes: [ :name ] ]))
    # @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [ :name ]))
    @portfolio_item = Portfolio.new(portfolio_params)

    # binding.break

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_url, notice: "Portfolio item was successfully created." }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_url, notice: "Portfolio Item was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # Destroys/deletes the found portfolio item
    @portfolio_item.destroy!

    # Redirects to index with success message
    respond_to do |format|
      format.html { redirect_to portfolios_url, status: :see_other, notice: "Portfolio item was successfully destroyed." }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [ :name ])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params.expect(:id))
  end
end
