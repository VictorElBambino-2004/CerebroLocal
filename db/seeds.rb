# Cargar las preguntas curadas en la base de datos
puts "Cargando preguntas de trivia..."

loaded_count = 0
AiQuestionGenerator::FALLBACKS.each do |category, questions|
  questions.each do |q|
    record = Question.find_or_create_by(prompt: q[:prompt]) do |question|
      question.category = category
      question.options = q[:options].shuffle
      question.correct_answer = q[:correct_answer]
    end
    loaded_count += 1 if record.persisted?
  end
end

puts "¡Listo! Total de preguntas registradas en la base de datos: #{Question.count} (procesadas: #{loaded_count})"
