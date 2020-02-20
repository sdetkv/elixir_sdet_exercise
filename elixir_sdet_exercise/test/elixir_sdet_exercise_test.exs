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
