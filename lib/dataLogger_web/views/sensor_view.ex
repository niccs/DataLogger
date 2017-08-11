defmodule DataLoggerWeb.SensorView do
  use DataLoggerWeb, :view
  alias DataLoggerWeb.SensorView

  def render("index.json", %{sensors: sensors}) do
    %{data: render_many(sensors, SensorView, "sensor.json")}
  end

  def render("show.json", %{sensor: sensor}) do
    %{data: render_one(sensor, SensorView, "sensor.json")}
  end

  def render("sensor.json", %{sensor: sensor}) do
    %{id: sensor.id,
      temp: sensor.temp,
      humidity: sensor.humidity,
      sensor3: sensor.sensor3,
      sensor4: sensor.sensor4}
  end
end
