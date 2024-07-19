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

    map = list
    |> Enum.reduce(%{}, fn item, acc ->
      Map.update(acc, item, 1, &(&1 + 1))
    end)

    processar_nomes(map)
  end

  defp processar_nomes(map) do
    map
    |> Enum.flat_map(fn {key, value} ->
      for i <- 1..value, do: {key, numero_para_romano(i)}
    end)
  end

  defp numero_para_romano(num) do
    numeros = [1000, 900, 500, 400,100, 90, 50, 40,10, 9, 5, 4, 1]
    romanos = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

    {resultado, _} = Enum.reduce(numeros, {"" , num}, fn numero, {acc, rem} ->
      count = div(rem, numero)
      new_acc = acc <> String.duplicate(Enum.at(romanos, Enum.find_index(numeros, &(&1 == numero))), count)
      new_rem = rem - (numero * count)
      {new_acc, new_rem}
    end)

    resultado
  end
end
