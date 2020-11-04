require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # Pegar todas as receitas do cookbook
    recipes = @cookbook.all
    # Mandar para a view exibir
    @view.display(recipes)
  end

  def create
    # Perguntar o nome da receita
    name = @view.ask_recipe_name
    # Perguntar a descricao da receita
    description = @view.ask_recipe_description
    # Instaciar uma nova receita
    new_recipe = Recipe.new(name, description)
    # Adicionar a receita ao cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # Listar as receitas
    list
    # Perguntar o index da receita para excluir
    index = @view.ask_index
    # Remover do cookbook a receita pelo index
    @cookbook.remove_recipe(index)
  end
end
