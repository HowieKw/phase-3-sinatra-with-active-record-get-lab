class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    'Hello Baked Fans!'
  end

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods' do
    baked_goods = BakedGood.all
    baked_goods.to_json
  end


  # *Can make more dynamic by making a self.by_price in BakedGood class
  # def self.by_price
  #   self.all.order(price: :desc)
  #  end
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end 

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
  end 

end
