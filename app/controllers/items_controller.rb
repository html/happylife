class ItemsController < ApplicationController
  access_control do 
    allow :admin
    allow all, :to => [:show, :index]
  end

  def index
    @items = Items.all
  end
  
  def show
    @items = Items.find(params[:id])
  end
  
  def new
    @items = Items.new
  end
  
  def create
    @items = Items.new(params[:items])
    if @items.save
      flash[:notice] = "Successfully created items."
      redirect_to @items
    else
      render :action => 'new'
    end
  end
  
  def edit
    @items = Items.find(params[:id])
  end
  
  def update
    @items = Items.find(params[:id])
    if @items.update_attributes(params[:items])
      flash[:notice] = "Successfully updated items."
      redirect_to @items
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @items = Items.find(params[:id])
    @items.destroy
    flash[:notice] = "Successfully destroyed items."
    redirect_to items_url
  end
end
