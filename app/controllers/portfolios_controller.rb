class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.friendly.all
  end 

  def angular
    @angular_portfolio_items = Portfolio.friendly.angular
  end
  
  def new
    @portfolio_item = Portfolio.friendly.new
    3.times do @portfolio_item.technologies.build end 
  end

  def create
    @portfolio_item = Portfolio.friendly.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))
     respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end


  def update
    @portfolio_item = Portfolio.friendly.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.friendly.find(params[:id])
  end 

  def destroy
    @portfolio_item = Portfolio.friendly.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully destroyed.' }
    end
  end 

end
