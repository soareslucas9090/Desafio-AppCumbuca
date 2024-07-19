defmodule DesafioCli do
  @moduledoc """
  Documentation for `DesafioCli`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DesafioCli.hello()
      :world

  """
  def main do
    IO.puts("###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###")
    string1 = ~s(Insira os nomes desajados um por linha. Envie "0" para fianlizar.)
    IO.puts(string1)
  end

end
