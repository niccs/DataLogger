defmodule DataLogger.SensorTest do
  use DataLogger.ModelCase

  alias DataLogger.Sensor

  @valid_attrs %{humidity: "some humidity", sensor3: "some sensor3", sensor4: "some sensor4", temp: "some temp"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sensor.changeset(%Sensor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sensor.changeset(%Sensor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
