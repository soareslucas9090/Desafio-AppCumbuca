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
    leitura_de_nomes()
  end

  defp leitura_de_nomes(acc \\ []) do
    input = IO.gets("") |> String.trim()

    if input == "0" do
      contar_nomes(acc)
    else
      leitura_de_nomes(acc ++ [input])
    end
  end

  defp contar_nomes(list) do
    if [] == list do
      IO.puts("###   Nenhum nome enviado!   ###")
    end

   list
    |> Enum.reduce(%{}, fn item, acc ->
      Map.update(acc, item, 1, &(&1 + 1))
    end)


  end


end
