class View
  def ask_recipe_name
    puts 'Enter recipe name:'
    gets.chomp
  end

  def ask_recipe_description
    puts 'Enter recipe description:'
    gets.chomp
  end

  def ask_index
    puts 'Enter index:'
    gets.chomp.to_i - 1
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end
end
