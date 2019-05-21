defmodule ElixirSdetExerciseTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to google" do
    navigate_to "http://google.com"
    IO.inspect page_title()
  end
end
