# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # TipoImovel.create(nome: 'Apartamento')
  # TipoImovel.create(nome: 'Casa')
  # TipoImovel.create(nome: 'Ponto Comercial')
  # TipoImovel.create(nome: 'Terreno')
  
  # Criar permissões  
  role1 = Role.new
  role1.name = 'Admin'
  role1.save
  
  role2 = Role.new
  role2.name = 'Corretor'
  role2.save
  
  # Criar primeiro usuário
  user = User.create!(:email=>'admin@admin.com',:username=>'admin',:password=>'admin123.')
  user.role_ids = 1
  user.save

  # Criar tipos de imovel
  tipo = TipoImovel.create!(:nome => 'Apartamento')
  tipo.save
  
  tipo2 = TipoImovel.create!(:nome => 'Casa')
  tipo2.save
  
  tipo3 = TipoImovel.create!(:nome => 'Ponto Comercial')
  tipo3.save
  
  tipo4 = TipoImovel.create!(:nome => 'Terreno')
  tipo4.save
  
  # Criar transacao de imovel
  transacao1 = TransacaoImovel.create!(:descricao => 'Aluguel')
  transacao1.save
  
  transacao2 = TransacaoImovel.create!(:descricao => 'Venda')
  transacao2.save
  
