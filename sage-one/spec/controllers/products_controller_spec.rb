require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    let(:products) { FactoryGirl.create_list(:product, 3) }
    
    before do
      get :index
    end

    it 'assigns products to @product' do
      expect(assigns[:products]).to match_array(products)
    end

    it 'returns http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render template index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before do 
      get :new
    end

    it 'assigns a new product to @product' do
      expect(assigns[:product]).to be_a_new(Product)
    end

    it 'returns http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render template new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:product) { FactoryGirl.attributes_for(:product) }

      it 'save product on database' do
        expect {
          post :create, product: product
        }.to change(Product, :count).by(1)
      end

      it 'return http status ok' do
        post :create, product: product
        expect(response).to have_http_status(:redirect)
      end

      it 'redirect to show action' do
        post :create, product: product
        expect(response).to redirect_to(product_path(assigns[:product]))
      end

      it 'set a flash message' do
        post :create, product: product
        expect(controller).to set_flash[:notice]
      end
    end

    context 'with invalid attributes' do
      let(:product) { FactoryGirl.attributes_for(:product, name: nil) }

      it 'not save product on database' do
        expect {
          post :create, product: product
        }.to_not change(Product, :count)
      end

      it 'return http status ok' do
        post :create, product: product
        expect(response).to have_http_status(:ok)
      end

      it 're-render new template' do
        post :create, product: product
        expect(response).to render_template(:new)
      end

      it 'set a flash message' do
        post :create, product: product
        expect(controller).to set_flash[:error]
      end
    end
  end

  describe 'GET #show' do
    context 'when product exist' do
      let(:product) { FactoryGirl.create(:product) }

      before do
        get :show, id: product.id
      end

      it 'assigns product to @product' do
        expect(assigns[:product]).to eq(product)
      end

      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'render template show' do
        expect(response).to render_template(:show)
      end
    end

    context 'when product do not exist' do
      it 'raise a ActiveRecord::RecordNotFound exception' do
        expect {
          get :show, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET #edit' do
    let(:product) { FactoryGirl.create(:product) }

    before do 
      get :edit, id: product.id
    end

    it 'assigns a new product to @product' do
      expect(assigns[:product]).to eq(product)
    end

    it 'returns http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'render template new' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'when record exist' do
      let(:product) { FactoryGirl.create(:product) }

      context 'with valid attributes' do
        let(:product_attributes) { FactoryGirl.attributes_for(:product) }
        before do
          put :update, id: product.id, product: product_attributes
        end
        
        it 'assigns product to @product' do
          expect(assigns[:product]).to eq(product)
        end

        it 'change product on database' do
          product.reload
          expect(product.name).to eq(product_attributes[:name])
        end

        it 'redirect to product page' do
          expect(response).to redirect_to(product_path(product))
        end

        it 'return http status redirect' do
          expect(response).to have_http_status(:redirect)
        end

        it 'set a flash message' do
          expect(controller).to set_flash[:notice]
        end
      end

      context 'with invalid attributes' do
        let(:product_attributes) { FactoryGirl.attributes_for(:product, name: nil) }
        before do
          put :update, id: product.id, product: product_attributes
        end

        it 'assigns product to @product' do
          expect(assigns[:product]).to eq(product)
        end

        it 'not change product on database' do
          expect(product.name).to_not be_nil
        end

        it 're-render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'return http status ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'set a flash message' do
          expect(controller).to set_flash[:error]
        end
      end
    end

    context 'when product do not exist' do
      it 'raise a ActiveRecord::RecordNotFound exception' do
        expect {
          get :show, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when product exist' do
      let(:product) { FactoryGirl.create(:product) }
      
      it 'remove product from database' do
        product
        expect {
          delete :destroy, id: product.id
        }.to change(Product, :count).by(-1)
      end

      it 'set a flash message' do
        delete :destroy, id: product.id
        expect(controller).to set_flash[:notice]
      end

      it 'have http status redirect' do
        delete :destroy, id: product.id
        expect(response).to have_http_status(:redirect)
      end

      it 'redirect to products path' do
        delete :destroy, id: product.id
        expect(response).to redirect_to(products_path)
      end
    end
    context 'when product do not exist' do
      it 'raise a ActiveRecord::RecordNotFound exception' do
        expect {
          delete :destroy, id: -9999
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#import' do
    let(:import_file) { FactoryGirl.attributes_for(:import_file) }
    let(:invalid_import_file) { FactoryGirl.attributes_for(:invalid_import_file) }

    it 'create products from file' do
      expect {
        post :import, import_file: import_file
      }.to change(Product, :count).by(3)
    end

    it 'set flash error with message when file is invalid' do
      post :import, import_file: invalid_import_file
      expect(controller).to set_flash[:error]
    end
  end
end
