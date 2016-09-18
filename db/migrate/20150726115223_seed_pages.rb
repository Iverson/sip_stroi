class SeedPages < ActiveRecord::Migration
  def up
  	Page.create([
      {name: 'Главная', uri: '/', meta_attributes: {title: 'Главная'}},
      {name: 'О компании', uri: '/about', meta_attributes: {title: 'О компании'}},
      {name: 'Проекты', uri: '/projects', meta_attributes: {title: 'Проекты'}},
      {name: 'Панели', uri: '/panels', meta_attributes: {title: 'Панели'}},
      {name: 'Фото', uri: '/photos', meta_attributes: {title: 'Фото'}},
      {name: 'Отзывы', uri: '/reviews', meta_attributes: {title: 'Отзывы'}},
  		{name: 'Статьи', uri: '/articles', meta_attributes: {title: 'Статьи'}}
    ])
  end

  def down
  	
  end
end
