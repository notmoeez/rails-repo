class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def edit
    @portfolio_item = Portfolio.find(params.expect(:id))
  end

  def create
    @portfolio_item = Portfolio.new(params.expect(portfolio: [ :title, :subtitle, :body ]))

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
      if @portfolio_item.update(params.expect(portfolio: [ :title, :subtitle, :body ]))
        format.html { redirect_to portfolios_url, notice: "Portfolio Item was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
