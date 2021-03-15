Rails.application.routes.draw do

get("/", {:controller => "application", :action => "index"})


  # Routes for the Alternative resource:

  # CREATE
  post("/insert_alternative", { :controller => "alternatives", :action => "create" })
          
  # READ
  get("/alternatives", { :controller => "alternatives", :action => "index" })
  
  get("/alternatives/:path_id", { :controller => "alternatives", :action => "show" })
  
  # UPDATE
  
  post("/modify_alternative/:path_id", { :controller => "alternatives", :action => "update" })
  
  # DELETE
  get("/delete_alternative/:path_id", { :controller => "alternatives", :action => "destroy" })

  #------------------------------

  # Routes for the Type resource:

  # CREATE
  post("/insert_type", { :controller => "types", :action => "create" })
          
  # READ
  get("/types", { :controller => "types", :action => "index" })
  
  get("/types/:path_id", { :controller => "types", :action => "show" })
  
  # UPDATE
  
  post("/modify_type/:path_id", { :controller => "types", :action => "update" })
  
  # DELETE
  get("/delete_type/:path_id", { :controller => "types", :action => "destroy" })

  #------------------------------

  # Routes for the Original ingredient resource:

  # CREATE
  post("/insert_original_ingredient", { :controller => "original_ingredients", :action => "create" })
          
  # READ
  get("/original_ingredients", { :controller => "original_ingredients", :action => "index" })
  
  get("/original_ingredients/:path_id", { :controller => "original_ingredients", :action => "show" })
  
  # UPDATE
  
  post("/modify_original_ingredient/:path_id", { :controller => "original_ingredients", :action => "update" })
  
  # DELETE
  get("/delete_original_ingredient/:path_id", { :controller => "original_ingredients", :action => "destroy" })

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
