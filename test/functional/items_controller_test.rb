require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def setup
    login_as users(:admin)
  end

  context "index action" do
    should "render index template" do
      get :index
      assert_template 'index'
    end
  end
  
  context "show action" do
    should "render show template" do
      get :show, :id => Items.first
      assert_template 'show'
    end
  end
  
  context "when logged in as site administrator" do
      
    context "new action" do
      should "render new template" do
        get :new
        assert_template 'new'
      end
    end
    
    context "create action" do
      should "render new template when model is invalid" do
        Items.any_instance.stubs(:valid?).returns(false)
        post :create
        assert_template 'new'
      end
      
      should "redirect when model is valid" do
        Items.any_instance.stubs(:valid?).returns(true)
        post :create
        assert_redirected_to item_url(assigns(:items))
      end
    end
    
    context "edit action" do
      should "render edit template" do
        get :edit, :id => Items.first
        assert_template 'edit'
      end
    end
    
    context "update action" do
      should "render edit template when model is invalid" do
        Items.any_instance.stubs(:valid?).returns(false)
        put :update, :id => Items.first
        assert_template 'edit'
      end
    
      should "redirect when model is valid" do
        Items.any_instance.stubs(:valid?).returns(true)
        put :update, :id => Items.first
        assert_redirected_to item_url(assigns(:items))
      end
    end
    
    context "destroy action" do
      should "destroy model and redirect to index action" do
        items = Items.first
        delete :destroy, :id => items
        assert_redirected_to items_url
        assert !Items.exists?(items.id)
      end
    end
  end
end
