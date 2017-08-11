defmodule DataLogger.Sensors.Sensor do
  use Ecto.Schema
  import Ecto.Changeset
  alias DataLogger.Sensors.Sensor


  schema "sensors" do
    field :humidity, :string
    field :sensor3, :string
    field :sensor4, :string
    field :temp, :string

    timestamps()
  end

  @doc false
  def changeset(%Sensor{} = sensor, attrs) do
    sensor
    |> cast(attrs, [:temp, :humidity, :sensor3, :sensor4])
    |> validate_required([:temp, :humidity, :sensor3, :sensor4])
  end
end
