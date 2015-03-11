class AddDefaultInstancesToProjects < ActiveRecord::Migration
  def up
    if Project.count
      Project.all.each do |project|
        project.instances.delete_all

        project.instances.create([
          {"name"=>"Изготовление комплекта дома", "price"=>"100000", "description"=>"Домокомплект", "default"=>"1"},
          {"name"=>"Возведение фундамента", "price"=>"100000", "description"=>"Стальные винтовые сваи. Диаметр сваи 108 мм, длина 2500 мм, диаметр лопасти 300 мм. Завинчивание, бетонирование ствола до уровня подрезки, крепление оголовка.", "default"=>"1"},
          {"name"=>"Монтаж комплекта дома", "price"=>"100000", "description"=>"Все расходные материалы, разгрузка и складирование комплекта дома на участке, монтаж", "default"=>"1"},
          {"name"=>"Покрытие кровли", "price"=>"100000", "description"=>"Гибкая черепица Шинглас (Shinglas)", "default"=>"1"},
          {"name"=>"Установка окон", "price"=>"100000", "description"=>"ПВХ профиль, 3-х камерный, белый, 2-х камерный стеклопакет", "default"=>"1"},
          {"name"=>"Отделка цоколя", "price"=>"100000", "description"=>"Фасадные панели Вандштейн (Wandstein)", "default"=>"1"},
          {"name"=>"Отделка фасада", "price"=>"100000", "description"=>"Виниловый сайдинг Хольцпласт (Holzplast)", "default"=>"1"},
          {"name"=>"Подшивка свесов кровли", "price"=>"100000", "description"=>"Пластиковые софиты", "default"=>"1"},
          {"name"=>"Установка водосточной системы", "price"=>"100000", "description"=>"Пластиковая водосточная система", "default"=>"1"},
          {"name"=>"Установка входной двери", "price"=>"100000", "description"=>"Металлическая дверь Торэкс", "default"=>"1"}
        ])
      end
    end
  end

  def down
  end
end
