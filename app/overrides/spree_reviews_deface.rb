Deface::Override.new(:virtual_path => "products/show",
                     :name => "converted_product_properties_96011462",
                     :insert_after => "[data-hook='product_properties'], #product_properties[data-hook]",
                     :text => "<%= render :partial => 'shared/reviews', :locals => { :product => @product, :reviews => @product.reviews.visible } %>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :name => "converted_inside_head_555899529",
                     :insert_after => "[data-hook='inside_head'], #inside_head[data-hook]",
                     :text => " <%= stylesheet_link_tag('reviews.css') %> ",
                     :disabled => false)

Deface::Override.new(:virtual_path => "shared/_footer",
                     :name => "converted_footer_right_315720585",
                     :insert_after => "[data-hook='footer_right'], #footer_right[data-hook]",
                     :text => "
    <%= javascript_include_tag(\"jquery.rating.js\") %>
    <%= javascript_tag(\"$(document).ready(function(){$('.stars').rating({required:true});});\") %>
    ",
                     :disabled => false)

Deface::Override.new(:virtual_path => "admin/shared/_product_sub_menu",
                     :name => "converted_admin_product_sub_tabs_133298913",
                     :insert_after => "[data-hook='admin_product_sub_tabs'], #admin_product_sub_tabs[data-hook]",
                     :text => "
       <%= tab(:reviews, :label => 'review_management') %>
     ",
                     :disabled => false)

Deface::Override.new(:virtual_path => "admin/configurations/index",
                     :name => "converted_admin_configurations_menu_939353760",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(t('spree_reviews.review_settings'), admin_review_settings_path, t('spree_reviews.manage_review_settings')) %>",
                     :disabled => false)