class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end

  # Métodos gerados pelo attr_reader:
  # def name
  #   @name
  # end

  # def description
  #   @description
  # end
end

# recipe = Recipe.new('feijoada', 'carne de porco e arroz')


