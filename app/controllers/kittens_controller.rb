class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    find_kitten
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    find_kitten
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten
      flash[:success] = "Kitten successfully added!"
    else
      render :new
      flash.now[:danger] = "Something went wrong."
    end
  end

  def update
    find_kitten

    if @kitten.update(kitten_params)
      redirect_to @kitten
      flash[:success] = "Kitten successfully updated!"
    else
      render :new
      flash.now[:danger] = "Something went wrong."
    end
  end

  def destroy
    find_kitten.destroy
    flash[:success] = "Kitten record deleted."
    redirect_to root_path
  end

  private

    def find_kitten
      @kitten = Kitten.find(params[:id])
    end

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
