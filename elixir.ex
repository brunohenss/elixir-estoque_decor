defmodule Estoque do
  defstruct pecas: %{}

  def new() do
    %Estoque{}
  end

  def adicionar_peca(%Estoque{pecas: pecas} = estoque, id, nome, quantidade, preco) do
    nova_peca = %{nome: nome, quantidade: quantidade, preco: preco}
    novas_pecas = Map.put(pecas, id, nova_peca)
    %Estoque{estoque | pecas: novas_pecas}
  end

  def atualizar_peca(%Estoque{pecas: pecas} = estoque, id, novos_dados) do
    if Map.has_key?(pecas, id) do
      pecas_atualizadas = Map.update!(pecas, id, fn peca -> Map.merge(peca, novos_dados) end)
      %Estoque{estoque | pecas: pecas_atualizadas}
    else
      {:error, "Peça não cadastrada, verifique novamente"}
    end
  end

  def remover_peca(%Estoque{pecas: pecas} = estoque, id) do
    if Map.has_key?(pecas, id) do
      novas_pecas = Map.delete(pecas, id)
      %Estoque{estoque | pecas: novas_pecas}
    else
      {:error, "Peça não cadastrada, verifique novamente"}
    end
  end

  def listar_pecas(%Estoque{pecas: pecas}) do
    pecas
  end
end
