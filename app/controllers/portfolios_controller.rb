class PortfoliosController < ApplicationController
  layout "portfolio"
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
    @portfolio_item = Portfolio.find(params.expect(:id))
    # @portfolio_item.technologies.build
  end

  def show
    @portfolio_item = Portfolio.find(params.expect(:id))
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
    @portfolio_item = Portfolio.find(params.expect(:id))
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
    # Looks up the portfolio item by id
    @portfolio_item = Portfolio.find(params.expect(:id))

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
end
