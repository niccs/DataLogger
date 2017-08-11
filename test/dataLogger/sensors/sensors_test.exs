defmodule DataLogger.SensorsTest do
  use DataLogger.DataCase

  alias DataLogger.Sensors

  describe "sensors" do
    alias DataLogger.Sensors.Sensor

    @valid_attrs %{humidity: "some humidity", sensor3: "some sensor3", sensor4: "some sensor4", temp: "some temp"}
    @update_attrs %{humidity: "some updated humidity", sensor3: "some updated sensor3", sensor4: "some updated sensor4", temp: "some updated temp"}
    @invalid_attrs %{humidity: nil, sensor3: nil, sensor4: nil, temp: nil}

    def sensor_fixture(attrs \\ %{}) do
      {:ok, sensor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_sensor()

      sensor
    end

    test "list_sensors/0 returns all sensors" do
      sensor = sensor_fixture()
      assert Sensors.list_sensors() == [sensor]
    end

    test "get_sensor!/1 returns the sensor with given id" do
      sensor = sensor_fixture()
      assert Sensors.get_sensor!(sensor.id) == sensor
    end

    test "create_sensor/1 with valid data creates a sensor" do
      assert {:ok, %Sensor{} = sensor} = Sensors.create_sensor(@valid_attrs)
      assert sensor.humidity == "some humidity"
      assert sensor.sensor3 == "some sensor3"
      assert sensor.sensor4 == "some sensor4"
      assert sensor.temp == "some temp"
    end

    test "create_sensor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_sensor(@invalid_attrs)
    end

    test "update_sensor/2 with valid data updates the sensor" do
      sensor = sensor_fixture()
      assert {:ok, sensor} = Sensors.update_sensor(sensor, @update_attrs)
      assert %Sensor{} = sensor
      assert sensor.humidity == "some updated humidity"
      assert sensor.sensor3 == "some updated sensor3"
      assert sensor.sensor4 == "some updated sensor4"
      assert sensor.temp == "some updated temp"
    end

    test "update_sensor/2 with invalid data returns error changeset" do
      sensor = sensor_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_sensor(sensor, @invalid_attrs)
      assert sensor == Sensors.get_sensor!(sensor.id)
    end

    test "delete_sensor/1 deletes the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{}} = Sensors.delete_sensor(sensor)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_sensor!(sensor.id) end
    end

    test "change_sensor/1 returns a sensor changeset" do
      sensor = sensor_fixture()
      assert %Ecto.Changeset{} = Sensors.change_sensor(sensor)
    end
  end
end
