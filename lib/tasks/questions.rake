namespace :questions do
  desc "Precarga preguntas en la base de datos usando Ollama"
  task seed: :environment do
    categories = GamesController::CATEGORIES
    cantidad = 5 # Preguntas a generar por categoría

    puts "🧠 Precargando CerebroLocal con #{cantidad} preguntas por categoría..."

    categories.each do |cat|
      print "Generando para #{cat}... "
      cantidad.times { AiQuestionGenerator.generate(cat) }
      puts "¡Listo!"
    end

    puts "✨ Precarga completa. Preguntas guardadas en PostgreSQL: #{Question.count}"
  end
end