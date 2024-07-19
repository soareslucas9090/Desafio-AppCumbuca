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

  test "Inserção em ordem" do
    input = "Ana\nAna\nAna\nAna\nAna\nAna\nJoão\nJoão\nMaria\nMaria\n0\n"
    output = capture_io(input, fn ->
      DesafioCli.main()
    end)
    assert output == """
          ###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###
          Insira os nomes desajados um por linha. Envie "0" para fianlizar.
          Ana I
          Ana II
          Ana III
          Ana IV
          Ana V
          Ana VI
          João I
          João II
          Maria I
          Maria II
          """
  end

  test "Inserção fora de ordem" do
    input = "Maria\nAna\nAna\nJoão\nAna\nJoão\nMaria\nAna\nAna\nJoão\nAna\n0\n"
    output = capture_io(input, fn ->
      DesafioCli.main()
    end)
    assert output == """
          ###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###
          Insira os nomes desajados um por linha. Envie "0" para fianlizar.
          Maria I
          Ana I
          Ana II
          João I
          Ana III
          João II
          Maria II
          Ana IV
          Ana V
          João III
          Ana VI
          """
  end

  test "Inserção original 1 do Desafio - Eng. Suporte" do
    input = "Eduardo\nMaria\nDaniel\nEduardo\n0\n"
    output = capture_io(input, fn ->
      DesafioCli.main()
    end)
    assert output == """
          ###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###
          Insira os nomes desajados um por linha. Envie "0" para fianlizar.
          Eduardo I
          Maria I
          Daniel I
          Eduardo II
          """
  end

  test "Inserção original 2 do Desafio - Eng. Suporte" do
    input = "João\nJoão\nJoão\nJoão\n0\n"
    output = capture_io(input, fn ->
      DesafioCli.main()
    end)
    assert output == """
          ###   Ferramenta de numeração de reis e rainhas de Cumbuquia   ###
          Insira os nomes desajados um por linha. Envie "0" para fianlizar.
          João I
          João II
          João III
          João IV
          """
  end
end
