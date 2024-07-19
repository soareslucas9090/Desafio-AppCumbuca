defmodule DesafioCliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias DesafioCli

  test "Leitura sem registro" do
    input = "0\n"
    output = capture_io(input, fn ->
      DesafioCli.main()
    end)
    assert output == """
           ###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###
           Insira os nomes desajados um por linha. Envie "0" para fianlizar.
           ###   Nenhum nome enviado!   ###
           """
  end
end
