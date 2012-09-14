# encoding: utf-8
Fabricator(:item) do
  brand "Soundheiss"
  model "KDO-22"
  price 430
  kind Item.category_for(:kinds, :accessory)
  quantity 20
  reference_id 392
end