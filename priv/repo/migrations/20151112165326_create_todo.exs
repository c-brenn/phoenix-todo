defmodule CsTodo.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :description, :string
      add :url, :string
      add :due_date, :date

      timestamps
    end

  end
end
