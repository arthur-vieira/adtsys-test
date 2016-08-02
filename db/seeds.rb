# encoding: UTF-8

brand_names = %w(Chevrolet Citroën Fiat Ford Honda Hyundai Kia Mitsubishi Nissan Peugeot Renault Toyota Volkswagen)

brand_names.each do |name|
  Brand.find_or_create_by name: name
end

puts "#{brand_names.size} car brands created"
