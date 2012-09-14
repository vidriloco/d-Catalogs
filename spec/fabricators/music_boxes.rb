Fabricator(:music_box) do
  title 'Parachutes'
  artist 'Coldplay'
  price 240
  label 'Parlophone'
  quantity 400
  reference_id 32
  
  presentation_format MusicBox.category_for(:presentation_formats, :single)
  kind MusicBox.category_for(:kinds, :cd)
end