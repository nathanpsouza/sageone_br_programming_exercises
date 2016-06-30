class ProductsController < ApplicationController
  before_action :load_product, except: [:index, :new, :create, :import]

  def index
    @products = Product.all
    @import_file = ImportFile.new
  end

  def new 
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      flash[:notice] = "Produto cadastrado com sucesso."
      redirect_to product_path(@product)
    else
      flash[:error] = "Erro. Verifique o formulário"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = "Produto atualizado com sucesso."
      redirect_to product_path(@product)
    else
      flash[:error] = "Erro. Verifique o formulário"
      render :edit
    end 
  end

  def destroy
    if @product.destroy
      flash[:notice] = "Produto removido."
    else
      flash[:error] = "falha ao remover o produto."
    end

    redirect_to products_path
  end

  def import
    @imported_file = ImportFile.new(params.fetch(:import_file, {}).permit(:file))

    if @imported_file.save
      begin
        importer = Importer::Base.new(@imported_file.file.path)
        importer.import
      rescue Exception => ex
        flash[:error] = "Arquivo em formato inválido"    
      end
    else
      flash[:error] = "Arquivo em formato inválido"    
    end

    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :category, :description, :barcode, :ncm, :unity, :value, :quantity)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
