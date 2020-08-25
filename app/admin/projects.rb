ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :content, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :content, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :name, :content, :price #, :imagedisable image upload temrporary

  #Form for upload image with activestorage
  # form do |f|
  #   f.semantic_errors # shows errors on :base
  #   f.inputs          # builds an input field for every attribute
  #   f.inputs do
  #     f.input :image, as: :file #method for adde image to activeadmin
  #   end
  #   f.actions         # adds the 'Submit' and 'Cancel' buttons
  # end

  show do |t|
    attributes_table do
      row :name
      row :content
      row :price
      #row :image do |ad|
        #project.image? ? image_tag(project.image.url, height: '100') : content_tag(:span, "No photo yet")
        #f.input :image, as: :file, hint: image_tag(f.object.image.variant(resize_to_limit: [100,100]))
       # image_tag url_for(ad.image), height: '100' 
       #<!--- Disable image upload temporary -->
      #end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :content
      f.input :price
      #f.input :image, as: :file, height: '100' #method for adde image to activeadmin -> disable image upload temporary
    end
    f.actions  
  end

end
