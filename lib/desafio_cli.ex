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
    input = IO.gets("")

    case input do
      "0\n" ->
        contar_nomes(acc)

      :eof ->
        contar_nomes(acc)

      _ ->
        input = String.trim(input)
        leitura_de_nomes(acc ++ [input])
    end
  end

  def contar_nomes(list) do
    if [] == list do
      IO.puts("###   Nenhum nome enviado!   ###")
    end

    lista_nomes =
      list
      |> Enum.reduce({[], %{}}, fn nome, {resultado, contagem} ->
        nova_contagem = Map.update(contagem, nome, 1, &(&1 + 1))
        resultado = resultado ++ ["#{nome} #{numero_para_romano(nova_contagem[nome])}"]
        {resultado, nova_contagem}
      end)
      |> elem(0)

    mostrar_nomes(lista_nomes)
  end

  defp mostrar_nomes(lista_nomes) do
    lista_nomes
    |> Enum.each(fn nome ->
      IO.puts("#{nome}")
    end)
  end

  defp numero_para_romano(num) when is_integer(num) and num > 0 and num < 4000 do
    numeros = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    romanos = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

    {resultado, _} =
      Enum.reduce(numeros, {"", num}, fn numero, {acc, rem} ->
        count = div(rem, numero)

        new_acc =
          acc <>
            String.duplicate(Enum.at(romanos, Enum.find_index(numeros, &(&1 == numero))), count)

        new_rem = rem - numero * count
        {new_acc, new_rem}
      end)

    resultado
  end
end
