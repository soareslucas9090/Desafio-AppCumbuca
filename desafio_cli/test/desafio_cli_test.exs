defmodule DesafioCliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias DesafioCli

  test "leitura sem registro" do
    input = "0\n"
    output = capture_io(fn ->
      send self(), {:io_request, self(), {self(), :put_chars, :unicode, input}}
      DesafioCli.main()
    end)
    IO.inspect(output)
    assert output == """
           ###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###
           Insira os nomes desajados um por linha. Envie "0" para fianlizar.
           ###   Nenhum nome enviado!   ###
           """
  end
end
