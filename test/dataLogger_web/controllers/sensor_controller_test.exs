defmodule DataLoggerWeb.SensorControllerTest do
  use DataLoggerWeb.ConnCase

  alias DataLogger.Sensors
  alias DataLogger.Sensors.Sensor

  @create_attrs %{humidity: "some humidity", sensor3: "some sensor3", sensor4: "some sensor4", temp: "some temp"}
  @update_attrs %{humidity: "some updated humidity", sensor3: "some updated sensor3", sensor4: "some updated sensor4", temp: "some updated temp"}
  @invalid_attrs %{humidity: nil, sensor3: nil, sensor4: nil, temp: nil}

  def fixture(:sensor) do
    {:ok, sensor} = Sensors.create_sensor(@create_attrs)
    sensor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sensors", %{conn: conn} do
      conn = get conn, sensor_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sensor" do
    test "renders sensor when data is valid", %{conn: conn} do
      conn = post conn, sensor_path(conn, :create), sensor: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, sensor_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "humidity" => "some humidity",
        "sensor3" => "some sensor3",
        "sensor4" => "some sensor4",
        "temp" => "some temp"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sensor_path(conn, :create), sensor: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sensor" do
    setup [:create_sensor]

    test "renders sensor when data is valid", %{conn: conn, sensor: %Sensor{id: id} = sensor} do
      conn = put conn, sensor_path(conn, :update, sensor), sensor: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, sensor_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "humidity" => "some updated humidity",
        "sensor3" => "some updated sensor3",
        "sensor4" => "some updated sensor4",
        "temp" => "some updated temp"}
    end

    test "renders errors when data is invalid", %{conn: conn, sensor: sensor} do
      conn = put conn, sensor_path(conn, :update, sensor), sensor: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sensor" do
    setup [:create_sensor]

    test "deletes chosen sensor", %{conn: conn, sensor: sensor} do
      conn = delete conn, sensor_path(conn, :delete, sensor)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, sensor_path(conn, :show, sensor)
      end
    end
  end

  defp create_sensor(_) do
    sensor = fixture(:sensor)
    {:ok, sensor: sensor}
  end
end
