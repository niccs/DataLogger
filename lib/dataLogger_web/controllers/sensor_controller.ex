defmodule DataLoggerWeb.SensorController do
  use DataLoggerWeb, :controller

  alias DataLogger.Sensors
  alias DataLogger.Sensors.Sensor

  action_fallback DataLoggerWeb.FallbackController

  def index(conn, _params) do
    sensors = Sensors.list_sensors()
    IO.inspect sensors
    # DataLoggerWeb.SensorView.render("show.json", sensor: %Sensor{humidity: "44", temp: "44", sensor3: "22", sensor4: "kk"}
    # sensorData = %{
    #         "name" => "22",
    #         "body" => "44"
    #       }
    # DataLoggerWeb.Endpoint.broadcast("sensor:1", "STATE_NEW", %{humidity: "70", temp: "70", sensor3: "78", sensor4: "80"})
    render(conn, "index.json", sensors: sensors)
  end

  def create(conn, %{"sensor" => sensor_params}) do
    with {:ok, %Sensor{} = sensor} <- Sensors.create_sensor(sensor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", sensor_path(conn, :show, sensor))
      |> render("show.json", sensor: sensor)
    end
  end
  def add_data(conn, params) do
    with {:ok, %Sensor{} = sensor} <- Sensors.create_sensor(params) do
    # changeset = Sensor.changeset(%Sensor{}, params)
    # case Repo.insert(changeset) do
    #   {:ok, sensor} ->

        # DataLoggerWeb.Endpoint.broadcast("sensor:1", "STATE_NEW", render("show.json", sensor: sensor))
       IO.inspect params
        DataLoggerWeb.Endpoint.broadcast("sensor:1", "STATE_NEW", %{sensor: params})
        conn
        |> put_status(:created)
        |> put_resp_header("location", sensor_path(conn, :show, sensor))
        |> render("show.json", sensor: sensor)
    
    end
  end

  def show(conn, %{"id" => id}) do
    sensor = Sensors.get_sensor!(id)
    render(conn, "show.json", sensor: sensor)
  end

  def update(conn, %{"id" => id, "sensor" => sensor_params}) do
    sensor = Sensors.get_sensor!(id)

    with {:ok, %Sensor{} = sensor} <- Sensors.update_sensor(sensor, sensor_params) do
      render(conn, "show.json", sensor: sensor)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensor = Sensors.get_sensor!(id)
    with {:ok, %Sensor{}} <- Sensors.delete_sensor(sensor) do
      send_resp(conn, :no_content, "")
    end
  end
end
