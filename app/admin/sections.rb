ActiveAdmin.register Section do
  menu false

  permit_params :position
  
  reorderable
end
