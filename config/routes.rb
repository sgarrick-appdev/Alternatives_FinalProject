Rails.application.routes.draw do

get("/", {:controller => "original_ingredients", :action => "index"})

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
  
  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })
          
  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })


  # #------------------------------


  # Routes for the Alternative resource:

  # CREATE
  post("/insert_alternative", { :controller => "alternatives", :action => "create" })
          
  # READ
  get("/alternatives", { :controller => "alternatives", :action => "index" })
  
  get("/alternatives/:path_id", { :controller => "alternatives", :action => "show" })

  
  # DELETE
  get("/delete_alternative/:path_id", { :controller => "alternatives", :action => "destroy" })

  #------------------------------

  # Routes for the Original ingredient resource:

  # CREATE
  get("/create_new_alternative", {:controller => "original_ingredients", :action => "create_page"})
  post("/insert_original_ingredient", { :controller => "original_ingredients", :action => "create" })
          
  # READ
  get("/original_ingredients", { :controller => "original_ingredients", :action => "index" })
  
  get("/original_ingredients/:path_id", { :controller => "original_ingredients", :action => "show" })
  
  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
  
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
