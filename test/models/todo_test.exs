defmodule CsTodo.TodoTest do
  use CsTodo.ModelCase

  alias CsTodo.Todo

  @valid_attrs %{description: "some content", due_date: "2010-04-17", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Todo.changeset(%Todo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Todo.changeset(%Todo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
