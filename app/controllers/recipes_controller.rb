class RecipesController < ApplicationController

def index
    recipes = Recipe.all 
    render json: recipes, status: :ok
end

def create
    new_recipe = Recipe.create(:title, :minutes_to_complete, :instructions, user_id: session[:user_id])
    render json: new_recipe, status: :created
end

private

def recipe_params
    params.permit(:title, :minutes_to_complete, :instructions, :user_id)
end

end