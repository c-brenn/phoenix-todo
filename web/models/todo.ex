defmodule CsTodo.Todo do
  use CsTodo.Web, :model

  schema "todos" do
    field :description, :string
    field :url, :string
    field :due_date, Ecto.Date

    timestamps
  end

  @required_fields ~w(description due_date)
  @optional_fields ~w(url)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
