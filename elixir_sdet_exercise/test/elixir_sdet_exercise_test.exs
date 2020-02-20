defmodule ElixirSdetExerciseTest do
  @moduledoc """
  Tests for Facebook registration page
  """
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case
  
  @doc """
  Negative tests for validationg facebook register page
  """
  describe "Facebook register" do 
  
   @tag firstname: true
  test "signup with invalid first_name" do
     #Arrange
     invalid_values=["","&*&*((("]
     Enum.each invalid_values ,fn value ->
     #Navigate to facebook register page and fill valid input
     Hound.start_session
     navigate()
     form = find_element(:xpath, ~s|//*[@id="reg" or @name="reg" ]|,3) 
     fill_form(form)

    #refill with invalid value
    find_within_element(form, :id, "u_0_o") |> fill_field(value) # refill invalid first name
    :timer.sleep(3000)
    #Act
    find_within_element(form,:id, "u_0_13") |> click() #click register
    #Assert
      try do
         assert page_title() == "facebook -Log in or Sign up"
      rescue
       _  -> take_screenshot()
       end
    Hound.end_session
    end
  end
  
    @tag lastname: true
  test "signup with invalid last_name" do
     #Arrange
     invalid_values=["","&*&*((("]
     Enum.each invalid_values ,fn value ->
     #Navigate to facebook register page and fill valid input
     Hound.start_session
     navigate()
     form = find_element(:xpath, ~s|//*[@id="reg" or @name="reg" ]|,3) 
     fill_form(form)

    #refill with invalid value
    find_within_element(form, :id, "u_0_m") |> fill_field(value) # refill invalid last name
    :timer.sleep(3000)
    #Act
    find_within_element(form,:id, "u_0_13") |> click() #click register
    #Assert
      try do
         assert page_title() == "facebook -Log in or Sign up"
      rescue
       _  -> take_screenshot()
       end
    Hound.end_session
    end
  end
  
    @tag email: true
  test "signup with invalid email" do
     #Arrange
     invalid_values=["@","test","test@","@test.com","@te.st.com","te@st@"]
     Enum.each invalid_values ,fn value ->
     #Navigate to facebook register page and fill valid input
     Hound.start_session
     navigate()
     form =find_element(:xpath, ~s|//*[@id="reg" or @name="reg" ]| ,3) 
     fill_form(form)

    #refill with invalid value
    find_within_element(form, :id, "u_0_r") |> fill_field(value) #input invalid email
    :timer.sleep(3000)
    #Act
    find_within_element(form,:id, "u_0_13") |> click()  #click register
    #Assert
      try do
         assert page_title() == "facebook -Log in or Sign up"
      rescue
        _  ->  take_screenshot()
                     
       end
    Hound.end_session
    end

  end
  
  
   @tag password: true
  test "signup with invalid password" do
    #Arrange
    invalid_values=["@","","1a"]
    Enum.each invalid_values ,fn value ->
    #Navigate to facebook register page and fill valid input
    Hound.start_session
    navigate()
    form =find_element(:xpath, ~s|//*[@id="reg" or @name="reg" ]| ,3) 
    fill_form(form)

   #refill with invalid value
   find_within_element(form, :id, "u_0_w") |> fill_field(value) #input password
   :timer.sleep(3000)
   #Act
   find_within_element(form,:id, "u_0_13") |> click() #click register
   #Assert
     try do
        assert page_title() == "facebook -Log in or Sign up"
     rescue
       _  -> IO.puts "Taking screen shot*********"
          take_screenshot()
     
    end
   Hound.end_session
   end
 end
 
   defp navigate() do
    navigate_to("https://facebook.com",5)
    IO.puts page_title()
    assert page_title() == "Facebook - Log In or Sign Up"
  end

  defp select_item(element,value) do
     execute_script("document.getElementById(\"#{element}\").value = \"#{value}\"") 
 end 

  defp fill_form(form) do
    find_within_element(form, :id, "u_0_m") |> fill_field("FirstName") #input first_name
    find_within_element(form, :id, "u_0_o") |> fill_field("LastName")  #input last_name
    find_within_element(form, :id, "u_0_r") |> fill_field("test@test.com")  #input email
    find_within_element(form, :id, "u_0_w") |> fill_field("Password")  #input password
    :timer.sleep(2000)
    find_within_element(form, :xpath, ~s|//*[@value="1"][@type="radio"]|) |> click()  #click radiobutton
    find_within_element(form, :id, "u_0_u") |> fill_field("test@test.com")  #input re enter email
    :timer.sleep(8000)
  end
  end
end
