defmodule OtpFridgeExampleTest do
  use ExUnit.Case
  doctest OtpFridgeExample

  test "putting something in the fridge" do
    {:ok, fridge} = :gen_Server.start_link(OtpFridgeExample, [], [])
    assert :ok == :gen_server.call(fridge, {:store, :bacon})
  end

  test "removing something from the fridge" do
    {:ok, fridge} = :gen_Server.start_link(OtpFridgeExample, [], [])
    :gen_server.call(fridge, {:store, :bacon})
    assert {:ok, :bacon} == :gen_server.call(fridge, {:take, :bacon})
  end

  test "taking something from the fridge that isnt in there" do
    {:ok, fridge} = :gen_Server.start_link(OtpFridgeExample, [], [])
    assert :not_found == :gen_server.call(fridge, {:take, :bacon})
  end
end
